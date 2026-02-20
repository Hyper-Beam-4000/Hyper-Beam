import numpy as np
import re
from typing import Optional, List, Dict, Tuple, Any
from sentence_transformers import SentenceTransformer
from sklearn.metrics.pairwise import cosine_similarity
import sympy as sp
from sympy import sympify, simplify, latex


def simple_correctness(predicted_answer, expected_answer):
    return 0 if predicted_answer == expected_answer else 1

def simple_distance_vector(predicted_answer, expected_answer):
    return np.linalg.norm(predicted_answer - expected_answer)


# Vector embedding similarity metrics for LaTeX math proofs

# Global model cache to avoid reloading
_embedding_model: Optional[SentenceTransformer] = None

def _get_embedding_model(model_name: str = "all-MiniLM-L6-v2") -> SentenceTransformer:
    """Get or load the embedding model (cached for efficiency)."""
    global _embedding_model
    if _embedding_model is None:
        _embedding_model = SentenceTransformer(model_name)
    return _embedding_model


def proof_embedding_similarity(
    predicted_proof: str, 
    expected_proof: str, 
    model_name: str = "all-MiniLM-L6-v2"
) -> float:
    """
    Compute cosine similarity between two LaTeX math proofs using sentence embeddings.
    
    Args:
        predicted_proof: The predicted LaTeX proof text
        expected_proof: The expected/reference LaTeX proof text
        model_name: Name of the sentence transformer model to use
                   Options: "all-MiniLM-L6-v2" (fast, general purpose),
                           "all-mpnet-base-v2" (slower, higher quality),
                           "sentence-transformers/all-MiniLM-L12-v2" (balanced)
    
    Returns:
        Cosine similarity score between 0 and 1 (1 = identical, 0 = completely different)
    """
    model = _get_embedding_model(model_name)
    
    # Get embeddings for both proofs
    embeddings = model.encode([predicted_proof, expected_proof])
    
    # Compute cosine similarity
    similarity = cosine_similarity([embeddings[0]], [embeddings[1]])[0][0]
    
    return round(float(similarity), 4)


def proof_embedding_similarity_batch(
    predicted_proofs: List[str], 
    expected_proofs: List[str],
    model_name: str = "all-MiniLM-L6-v2"
) -> List[float]:
    """
    Compute cosine similarity for multiple proof pairs in batch (more efficient).
    
    Args:
        predicted_proofs: List of predicted LaTeX proof texts
        expected_proofs: List of expected/reference LaTeX proof texts
        model_name: Name of the sentence transformer model to use
    
    Returns:
        List of cosine similarity scores
    """
    if len(predicted_proofs) != len(expected_proofs):
        raise ValueError("predicted_proofs and expected_proofs must have the same length")
    
    model = _get_embedding_model(model_name)
    
    # Combine all texts for batch encoding
    all_texts = predicted_proofs + expected_proofs
    embeddings = model.encode(all_texts)
    
    # Split embeddings
    n = len(predicted_proofs)
    pred_embeddings = embeddings[:n]
    exp_embeddings = embeddings[n:]
    
    # Compute pairwise cosine similarities
    similarities = [
        round(float(cosine_similarity([pred], [exp])[0][0]), 4)
        for pred, exp in zip(pred_embeddings, exp_embeddings)
    ]
    
    return similarities


# ============================================================================
# INDUSTRY-STANDARD EVALUATION METRICS
# ============================================================================

def extract_final_answer(proof_text: str) -> Optional[str]:
    """
    Extract the final answer from a proof text.
    Industry standard: Used in MATH dataset evaluation.
    
    Looks for patterns like:
    - f(1000) = 1000
    - Answer: 42
    - Therefore, f(n) = n
    - \boxed{answer}
    - Final answer: ...
    
    Args:
        proof_text: LaTeX proof text
        
    Returns:
        Extracted answer string or None
    """
    # Remove LaTeX commands for cleaner matching
    text = proof_text
    
    # Pattern 1: \boxed{...}
    boxed_match = re.search(r'\\boxed\{([^}]+)\}', text)
    if boxed_match:
        return boxed_match.group(1).strip()
    
    # Pattern 2: Final answer patterns
    final_patterns = [
        r'(?:Therefore|Thus|Hence|So|We conclude|Final answer)[:\s]+(.+?)(?:\.|$|\n)',
        r'(?:Answer|Solution)[:\s]+(.+?)(?:\.|$|\n)',
    ]
    for pattern in final_patterns:
        match = re.search(pattern, text, re.IGNORECASE)
        if match:
            answer = match.group(1).strip()
            # Remove common LaTeX formatting
            answer = re.sub(r'\\text\{([^}]+)\}', r'\1', answer)
            return answer
    
    # Pattern 3: Look for explicit variable assignments at the end
    # e.g., "f(1000) = 1000" or "f(n) = n"
    assignment_pattern = r'([a-zA-Z_][a-zA-Z0-9_]*\s*\([^)]*\)\s*=\s*[^\n]+)'
    matches = list(re.finditer(assignment_pattern, text))
    if matches:
        # Take the last assignment as likely final answer
        return matches[-1].group(1).strip()
    
    # Pattern 4: Look for standalone numbers/expressions at the end
    lines = text.split('\n')
    for line in reversed(lines):
        line = line.strip()
        if line and not line.startswith('\\') and '=' in line:
            # Extract right side of equation
            if '=' in line:
                parts = line.split('=', 1)
                if len(parts) == 2:
                    answer = parts[1].strip()
                    if answer and len(answer) < 100:  # Reasonable answer length
                        return answer
    
    return None


def verify_answer_correctness(
    predicted_answer: Optional[str],
    expected_answer: Optional[str],
    problem_context: Optional[str] = None
) -> Tuple[bool, float]:
    """
    Verify if extracted answers are mathematically equivalent.
    Industry standard: Used in MATH dataset (Pass@1 metric).
    
    Uses symbolic computation to check equivalence, not just string matching.
    
    Args:
        predicted_answer: Extracted answer from predicted proof
        expected_answer: Extracted answer from expected proof
        problem_context: Optional problem statement for context
        
    Returns:
        Tuple of (is_correct: bool, confidence: float)
    """
    if predicted_answer is None or expected_answer is None:
        return False, 0.0
    
    # Try exact string match first (fast path)
    if predicted_answer.strip() == expected_answer.strip():
        return True, 1.0
    
    # Try symbolic equivalence using SymPy
    try:
        # Clean LaTeX and convert to SymPy expressions
        pred_clean = _clean_latex_for_sympy(predicted_answer)
        exp_clean = _clean_latex_for_sympy(expected_answer)
        
        pred_expr = sympify(pred_clean, evaluate=False)
        exp_expr = sympify(exp_clean, evaluate=False)
        
        # Check if expressions are mathematically equivalent
        diff = simplify(pred_expr - exp_expr)
        
        # If difference simplifies to 0, they're equivalent
        if diff == 0:
            return True, 1.0
        
        # Check if they're equal for common variable values
        # This is a heuristic for cases like "f(n) = n" vs "f(x) = x"
        if _expressions_equivalent(pred_expr, exp_expr):
            return True, 0.9
        
    except Exception:
        # If symbolic computation fails, fall back to string similarity
        pass
    
    # Fallback: Check if answers are similar strings
    similarity = _string_similarity(predicted_answer, expected_answer)
    return similarity > 0.8, similarity


def _clean_latex_for_sympy(text: str) -> str:
    """Convert LaTeX to SymPy-compatible format."""
    # Remove LaTeX commands
    text = re.sub(r'\\text\{([^}]+)\}', r'\1', text)
    text = re.sub(r'\\mathbb\{([^}]+)\}', r'\1', text)
    text = re.sub(r'\\to', '->', text)
    text = re.sub(r'\\cdot', '*', text)
    text = re.sub(r'\\times', '*', text)
    text = re.sub(r'\\div', '/', text)
    text = re.sub(r'\\frac\{([^}]+)\}\{([^}]+)\}', r'(\1)/(\2)', text)
    text = re.sub(r'\^', '**', text)
    text = re.sub(r'\\sqrt\{([^}]+)\}', r'sqrt(\1)', text)
    # Remove remaining LaTeX
    text = re.sub(r'\\[a-zA-Z]+\{?[^}]*\}?', '', text)
    return text.strip()


def _expressions_equivalent(expr1, expr2) -> bool:
    """Check if two SymPy expressions are equivalent."""
    try:
        # Try substituting common values
        test_values = [1, 2, 3, 10, 100, 1000]
        for val in test_values:
            try:
                if expr1.subs('n', val) != expr2.subs('n', val):
                    return False
                if expr1.subs('x', val) != expr2.subs('x', val):
                    return False
            except:
                continue
        return True
    except:
        return False


def _string_similarity(s1: str, s2: str) -> float:
    """Simple string similarity using longest common subsequence."""
    def lcs(s1, s2):
        m, n = len(s1), len(s2)
        dp = [[0] * (n + 1) for _ in range(m + 1)]
        for i in range(1, m + 1):
            for j in range(1, n + 1):
                if s1[i-1] == s2[j-1]:
                    dp[i][j] = dp[i-1][j-1] + 1
                else:
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
        return dp[m][n]
    
    lcs_len = lcs(s1.lower(), s2.lower())
    max_len = max(len(s1), len(s2))
    return lcs_len / max_len if max_len > 0 else 0.0


def rubric_based_scoring(
    predicted_proof: str,
    expected_proof: str,
    problem_statement: Optional[str] = None,
    rubric: Optional[Dict[str, float]] = None
) -> Dict[str, Any]:
    """
    Fine-grained rubric-based scoring (0-7 scale).
    Industry standard: Used in ProofBench/ProofGrader evaluation.
    
    Evaluates proofs on multiple dimensions:
    - Final answer correctness
    - Logical structure
    - Key steps present
    - Mathematical rigor
    
    Args:
        predicted_proof: Predicted proof text
        expected_proof: Expected/reference proof text
        problem_statement: Optional problem statement for context
        rubric: Optional custom rubric weights
        
    Returns:
        Dictionary with scores and breakdown
    """
    if rubric is None:
        rubric = {
            'final_answer': 2.0,      # Correct final answer
            'key_steps': 2.0,         # Essential logical steps present
            'logical_flow': 1.5,      # Coherent logical progression
            'rigor': 1.0,             # Mathematical rigor/justification
            'completeness': 0.5       # All necessary components
        }
    
    total_possible = sum(rubric.values())
    scores = {}
    
    # 1. Final answer correctness
    pred_answer = extract_final_answer(predicted_proof)
    exp_answer = extract_final_answer(expected_proof)
    is_correct, confidence = verify_answer_correctness(pred_answer, exp_answer, problem_statement)
    scores['final_answer'] = rubric['final_answer'] * (1.0 if is_correct else 0.0)
    
    # 2. Key steps analysis
    key_steps_score = _analyze_key_steps(predicted_proof, expected_proof)
    scores['key_steps'] = rubric['key_steps'] * key_steps_score
    
    # 3. Logical flow
    flow_score = _analyze_logical_flow(predicted_proof)
    scores['logical_flow'] = rubric['logical_flow'] * flow_score
    
    # 4. Rigor (presence of justifications, not just assertions)
    rigor_score = _analyze_rigor(predicted_proof)
    scores['rigor'] = rubric['rigor'] * rigor_score
    
    # 5. Completeness
    completeness_score = _analyze_completeness(predicted_proof, expected_proof)
    scores['completeness'] = rubric['completeness'] * completeness_score
    
    total_score = sum(scores.values())
    normalized_score = total_score / total_possible if total_possible > 0 else 0.0
    
    return {
        'total_score': round(total_score, 2),
        'normalized_score': round(normalized_score, 4),  # 0-1 scale
        'rubric_scale_score': round(normalized_score * 7, 2),  # 0-7 scale (ProofBench standard)
        'breakdown': scores,
        'final_answer_correct': is_correct
    }


def _analyze_key_steps(predicted: str, expected: str) -> float:
    """Analyze if key logical steps are present."""
    # Extract mathematical statements/equations from both proofs
    pred_steps = _extract_math_statements(predicted)
    exp_steps = _extract_math_statements(expected)
    
    if len(exp_steps) == 0:
        return 1.0 if len(pred_steps) > 0 else 0.0
    
    # Check overlap of key concepts/operations
    pred_concepts = _extract_concepts(pred_steps)
    exp_concepts = _extract_concepts(exp_steps)
    
    if len(exp_concepts) == 0:
        return 0.5
    
    overlap = len(pred_concepts & exp_concepts) / len(exp_concepts)
    return min(overlap, 1.0)


def _analyze_logical_flow(proof: str) -> float:
    """Analyze logical flow and coherence."""
    lines = [l.strip() for l in proof.split('\n') if l.strip()]
    
    if len(lines) < 2:
        return 0.3
    
    # Check for logical connectors
    connectors = ['implies', 'therefore', 'thus', 'hence', 'so', 'since', 'because', 
                  'if', 'then', 'let', 'assume', 'contradiction', '\\implies', '\\Rightarrow']
    has_connectors = any(any(c in line.lower() for c in connectors) for line in lines)
    
    # Check for progression (equations building on each other)
    has_equations = sum(1 for line in lines if '=' in line or '\\sim' in line or '\\equiv' in line)
    equation_ratio = has_equations / len(lines) if len(lines) > 0 else 0
    
    # Score based on structure
    score = 0.3  # Base score
    if has_connectors:
        score += 0.3
    if equation_ratio > 0.3:
        score += 0.2
    if len(lines) >= 5:  # Reasonable proof length
        score += 0.2
    
    return min(score, 1.0)


def _analyze_rigor(proof: str) -> float:
    """Analyze mathematical rigor (justifications, not just assertions)."""
    lines = [l.strip() for l in proof.split('\n') if l.strip()]
    
    if len(lines) == 0:
        return 0.0
    
    # Look for justification patterns
    justification_keywords = ['since', 'because', 'by', 'from', 'using', 'applying',
                             'we have', 'note that', 'observe', '\\because', '\\text{since}']
    
    justifications = sum(1 for line in lines 
                        if any(kw in line.lower() for kw in justification_keywords))
    
    # Look for proof techniques
    techniques = ['contradiction', 'induction', 'contrapositive', 'cases', 
                'direct proof', 'by definition']
    has_techniques = any(any(t in line.lower() for t in techniques) for line in lines)
    
    justification_ratio = justifications / len(lines) if len(lines) > 0 else 0
    
    score = justification_ratio * 0.6
    if has_techniques:
        score += 0.2
    if justification_ratio > 0.2:  # At least some justification
        score += 0.2
    
    return min(score, 1.0)


def _analyze_completeness(predicted: str, expected: str) -> float:
    """Analyze if proof is complete (has beginning, middle, conclusion)."""
    pred_lower = predicted.lower()
    
    # Check for proof structure markers
    has_start = any(marker in pred_lower for marker in ['let', 'assume', 'given', 'suppose'])
    has_middle = len([l for l in predicted.split('\n') if l.strip()]) >= 3
    has_end = any(marker in pred_lower for marker in ['therefore', 'thus', 'hence', 
                                                      '\\square', 'qed', 'proven'])
    
    score = 0.0
    if has_start:
        score += 0.3
    if has_middle:
        score += 0.4
    if has_end:
        score += 0.3
    
    return min(score, 1.0)


def _extract_math_statements(text: str) -> List[str]:
    """Extract mathematical statements/equations from text."""
    # Split by lines and filter for math content
    lines = text.split('\n')
    statements = []
    
    for line in lines:
        line = line.strip()
        if not line:
            continue
        # Look for equations, inequalities, or mathematical statements
        if any(op in line for op in ['=', '\\equiv', '\\sim', '\\leq', '\\geq', '<', '>', 
                                    '\\in', '\\subset', '\\subseteq']):
            statements.append(line)
        # Or lines with LaTeX math
        elif '\\' in line and any(c.isalpha() for c in line):
            statements.append(line)
    
    return statements


def _extract_concepts(statements: List[str]) -> set:
    """Extract mathematical concepts/operations from statements."""
    concepts = set()
    
    # Common mathematical operations and concepts
    math_patterns = [
        r'\\frac\{[^}]+\}\{[^}]+\}',  # Fractions
        r'[a-zA-Z]+\^\{?[^}]+\}?',    # Powers
        r'\\sqrt\{[^}]+\}',            # Roots
        r'\\sum|\\prod|\\int',         # Sums/products/integrals
        r'\\lim',                      # Limits
        r'f\([^)]+\)',                 # Functions
        r'[a-zA-Z]+\^[0-9]+',          # Powers (simple)
    ]
    
    for stmt in statements:
        for pattern in math_patterns:
            matches = re.findall(pattern, stmt)
            concepts.update(matches)
        
        # Extract function names
        func_matches = re.findall(r'([a-zA-Z]+)\([^)]+\)', stmt)
        concepts.update(func_matches)
    
    return concepts


def verify_lean_proof(lean_code: str, lean_executable: str = "lean") -> Dict[str, Any]:
    """
    Verify a Lean proof by attempting to compile/check it.
    Industry standard: Used in MiniF2F and formal verification benchmarks.
    
    Args:
        lean_code: Lean proof code
        lean_executable: Path to Lean executable (default: "lean")
        
    Returns:
        Dictionary with verification results
    """
    import subprocess
    import tempfile
    import os
    
    # Create temporary Lean file
    with tempfile.NamedTemporaryFile(mode='w', suffix='.lean', delete=False) as f:
        f.write(lean_code)
        temp_path = f.name
    
    try:
        # Try to check the Lean file
        result = subprocess.run(
            [lean_executable, temp_path],
            capture_output=True,
            text=True,
            timeout=30  # 30 second timeout
        )
        
        is_valid = result.returncode == 0
        error_message = result.stderr if not is_valid else None
        
        # Check for 'sorry' (incomplete proofs)
        has_sorry = 'sorry' in lean_code.lower()
        
        # Extract proof length (number of tactic applications)
        tactic_count = len(re.findall(r'\b(by|apply|exact|simp|rw|calc|sorry)\b', lean_code))
        
        return {
            'is_valid': is_valid,
            'has_sorry': has_sorry,
            'is_complete': is_valid and not has_sorry,
            'tactic_count': tactic_count,
            'error_message': error_message,
            'proof_length': len(lean_code.split('\n'))
        }
    
    except subprocess.TimeoutExpired:
        return {
            'is_valid': False,
            'has_sorry': 'sorry' in lean_code.lower(),
            'is_complete': False,
            'tactic_count': 0,
            'error_message': 'Proof checking timed out',
            'proof_length': len(lean_code.split('\n'))
        }
    except FileNotFoundError:
        return {
            'is_valid': False,
            'has_sorry': 'sorry' in lean_code.lower(),
            'is_complete': False,
            'tactic_count': 0,
            'error_message': f'Lean executable not found: {lean_executable}',
            'proof_length': len(lean_code.split('\n'))
        }
    finally:
        # Clean up temp file
        try:
            os.unlink(temp_path)
        except:
            pass


def comprehensive_proof_evaluation(
    predicted_proof: str,
    expected_proof: str,
    problem_statement: Optional[str] = None,
    lean_code: Optional[str] = None,
    use_embeddings: bool = True
) -> Dict[str, Any]:
    """
    Comprehensive multi-metric evaluation combining industry-standard approaches.
    
    Combines:
    1. Answer extraction + verification (MATH dataset style)
    2. Rubric-based scoring (ProofBench style)
    3. Embedding similarity (baseline)
    4. Lean verification (if Lean code provided)
    
    Args:
        predicted_proof: Predicted proof text
        expected_proof: Expected/reference proof text
        problem_statement: Optional problem statement
        lean_code: Optional Lean code for formal verification
        use_embeddings: Whether to include embedding similarity
        
    Returns:
        Comprehensive evaluation dictionary
    """
    results = {}
    
    # 1. Answer extraction and verification (MATH dataset metric)
    pred_answer = extract_final_answer(predicted_proof)
    exp_answer = extract_final_answer(expected_proof)
    is_correct, confidence = verify_answer_correctness(pred_answer, exp_answer, problem_statement)
    results['answer_verification'] = {
        'predicted_answer': pred_answer,
        'expected_answer': exp_answer,
        'is_correct': is_correct,
        'confidence': confidence
    }
    
    # 2. Rubric-based scoring (ProofBench style)
    rubric_results = rubric_based_scoring(predicted_proof, expected_proof, problem_statement)
    results['rubric_scoring'] = rubric_results
    
    # 3. Embedding similarity (baseline)
    if use_embeddings:
        embedding_sim = proof_embedding_similarity(predicted_proof, expected_proof)
        results['embedding_similarity'] = embedding_sim
    
    # 4. Lean verification (if provided)
    if lean_code:
        lean_results = verify_lean_proof(lean_code)
        results['lean_verification'] = lean_results
    
    # 5. Overall score (weighted combination)
    weights = {
        'answer_correctness': 0.4,      # Most important: did they get the answer?
        'rubric_score': 0.4,            # How good is the proof structure?
        'embedding_similarity': 0.1,    # Semantic similarity (baseline)
        'lean_verification': 0.1        # Formal verification (if available)
    }
    
    overall_score = 0.0
    if is_correct:
        overall_score += weights['answer_correctness']
    overall_score += weights['rubric_score'] * rubric_results['normalized_score']
    if use_embeddings:
        overall_score += weights['embedding_similarity'] * results['embedding_similarity']
    if lean_code and results.get('lean_verification', {}).get('is_complete', False):
        overall_score += weights['lean_verification']
    
    results['overall_score'] = round(overall_score, 4)
    results['overall_score_0_7'] = round(overall_score * 7, 2)  # ProofBench scale
    
    return results
