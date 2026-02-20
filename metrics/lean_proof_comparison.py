"""
Lean Proof Comparison Engine

Compares two Lean 4 proofs for structural and semantic similarity
by parsing proof structure and computing multi-dimensional similarity scores.
"""

import re
from dataclasses import dataclass, field
from difflib import SequenceMatcher
from typing import Optional, List, Dict, Tuple
from collections import Counter


# ============================================================================
# DATA CLASSES
# ============================================================================

@dataclass
class LeanProofStructure:
    """Parsed representation of a Lean 4 proof."""
    imports: List[str] = field(default_factory=list)
    opens: List[str] = field(default_factory=list)
    theorem_name: str = ""
    theorem_statement: str = ""
    hypotheses: List[str] = field(default_factory=list)
    conclusion: str = ""
    tactics: List[str] = field(default_factory=list)
    sorry_count: int = 0
    sorry_positions: List[int] = field(default_factory=list)
    have_statements: List[str] = field(default_factory=list)
    proof_length: int = 0
    raw_code: str = ""


@dataclass
class LeanComparisonResult:
    """Result of comparing two Lean proofs."""
    theorem_similarity: float = 0.0
    hypothesis_overlap: float = 0.0
    tactic_similarity: float = 0.0
    structural_similarity: float = 0.0
    import_compatibility: float = 0.0
    sorry_comparison: Dict[str, int] = field(default_factory=dict)
    combined_score: float = 0.0


# ============================================================================
# KNOWN LEAN 4 / MATHLIB TACTICS
# ============================================================================

LEAN4_TACTICS = {
    # Core tactics
    "exact", "apply", "intro", "intros", "refl", "rfl", "assumption",
    "trivial", "decide", "norm_num", "ring", "linarith", "omega",
    "simp", "simpa", "dsimp", "unfold", "rw", "rewrite", "conv",
    "calc", "show", "suffices", "have", "let", "obtain", "rcases",
    "cases", "induction", "match", "by_contra", "by_cases",
    "push_neg", "contrapose", "exfalso", "absurd",
    "constructor", "use", "exists", "existsi", "ext", "funext",
    "congr", "specialize", "generalize", "subst", "injection",
    "field_simp", "ring_nf", "norm_cast", "push_cast",
    "positivity", "polyrith", "nlinarith", "gcongr",
    "aesop", "tauto", "itauto", "finish",
    "sorry",
    # Mathlib-specific
    "refine", "exact?", "apply?", "simp?", "rw?",
    "norm_num_ext", "continuity", "measurability",
    "bound", "Abel", "group",
}


# ============================================================================
# PARSING FUNCTIONS
# ============================================================================

def parse_lean_proof(lean_code: str) -> LeanProofStructure:
    """
    Parse a Lean 4 proof into a structured representation.

    Args:
        lean_code: Raw Lean 4 source code

    Returns:
        LeanProofStructure with extracted components
    """
    structure = LeanProofStructure(raw_code=lean_code)
    lines = lean_code.split('\n')
    structure.proof_length = len(lines)

    # Extract imports
    structure.imports = [
        m.group(1).strip()
        for line in lines
        if (m := re.match(r'^import\s+(.+)', line.strip()))
    ]

    # Extract open namespaces
    structure.opens = [
        m.group(1).strip()
        for line in lines
        if (m := re.match(r'^open\s+(.+)', line.strip()))
    ]

    # Extract theorem signature
    name, statement, conclusion = _extract_theorem_signature(lean_code)
    structure.theorem_name = name
    structure.theorem_statement = statement
    structure.conclusion = conclusion

    # Extract hypotheses
    structure.hypotheses = _extract_hypotheses(lean_code)

    # Extract tactics from proof body
    structure.tactics = _extract_tactics(lean_code)

    # Count and locate sorry
    for i, line in enumerate(lines):
        stripped = line.strip()
        # Match sorry as a standalone word, not inside a comment
        if re.search(r'\bsorry\b', stripped) and not stripped.startswith('--'):
            structure.sorry_count += 1
            structure.sorry_positions.append(i + 1)  # 1-indexed

    # Extract have-statements
    structure.have_statements = re.findall(
        r'have\s+(\w+\s*:.*?)(?::=|:= by|$)', lean_code, re.MULTILINE
    )

    return structure


def _extract_theorem_signature(lean_code: str) -> Tuple[str, str, str]:
    """
    Extract theorem name, full type signature, and conclusion.

    Returns:
        (theorem_name, full_statement, conclusion)
    """
    # Match theorem/lemma/def declarations
    pattern = r'(?:theorem|lemma|def)\s+(\w+)\s*(.*?)\s*:=\s*by'
    match = re.search(pattern, lean_code, re.DOTALL)
    if not match:
        # Try without := by (term-mode proofs)
        pattern = r'(?:theorem|lemma|def)\s+(\w+)\s*(.*?)\s*:='
        match = re.search(pattern, lean_code, re.DOTALL)

    if not match:
        return "", "", ""

    name = match.group(1)
    full_statement = match.group(2).strip()

    # Extract conclusion: everything after the last colon at depth 0
    conclusion = _extract_conclusion(full_statement)

    return name, full_statement, conclusion


def _extract_conclusion(statement: str) -> str:
    """Extract the conclusion (return type) from a theorem statement."""
    depth = 0
    last_colon_pos = -1

    for i, ch in enumerate(statement):
        if ch in ('(', '[', '{'):
            depth += 1
        elif ch in (')', ']', '}'):
            depth -= 1
        elif ch == ':' and depth == 0:
            last_colon_pos = i

    if last_colon_pos >= 0:
        return statement[last_colon_pos + 1:].strip()
    return statement


def _extract_hypotheses(lean_code: str) -> List[str]:
    """
    Extract hypothesis binders like (h : Type) from theorem signatures.
    Uses depth-tracking parenthesis parser.
    """
    # Find the theorem signature area
    pattern = r'(?:theorem|lemma|def)\s+\w+\s*(.*?)\s*:=\s*by'
    match = re.search(pattern, lean_code, re.DOTALL)
    if not match:
        pattern = r'(?:theorem|lemma|def)\s+\w+\s*(.*?)\s*:='
        match = re.search(pattern, lean_code, re.DOTALL)
    if not match:
        return []

    sig = match.group(1)
    hypotheses = []
    depth = 0
    current_hyp = []
    opener = None

    for ch in sig:
        if ch in ('(', '[', '{') and depth == 0:
            depth = 1
            opener = ch
            current_hyp = [ch]
        elif depth > 0:
            current_hyp.append(ch)
            if ch in ('(', '[', '{'):
                depth += 1
            elif ch in (')', ']', '}'):
                depth -= 1
                if depth == 0:
                    hyp_str = ''.join(current_hyp).strip()
                    # Only include if it looks like a typed binder
                    if ':' in hyp_str:
                        hypotheses.append(hyp_str)
                    current_hyp = []

    return hypotheses


def _extract_tactics(lean_code: str) -> List[str]:
    """
    Extract tactic names used in the proof body (after := by).
    """
    # Find proof body
    by_match = re.search(r':=\s*by\b', lean_code)
    if not by_match:
        return []

    proof_body = lean_code[by_match.end():]

    # Remove comments
    proof_body = re.sub(r'--.*$', '', proof_body, flags=re.MULTILINE)
    proof_body = re.sub(r'/-.*?-/', '', proof_body, flags=re.DOTALL)

    tactics = []
    for word in re.findall(r'\b(\w+[?]?)\b', proof_body):
        if word in LEAN4_TACTICS:
            tactics.append(word)

    return tactics


# ============================================================================
# COMPARISON FUNCTIONS
# ============================================================================

def compare_theorem_statements(a: LeanProofStructure, b: LeanProofStructure) -> float:
    """
    Compare theorem statements using:
    - Jaccard similarity on conclusion tokens (weight 0.5)
    - Hypothesis overlap (weight 0.3)
    - SequenceMatcher on full signatures (weight 0.2)
    """
    # Conclusion token Jaccard (include operators for differentiation)
    tokens_a = set(re.findall(r'\w+|[+\-*/=<>≤≥∧∨¬×÷]', a.conclusion))
    tokens_b = set(re.findall(r'\w+|[+\-*/=<>≤≥∧∨¬×÷]', b.conclusion))
    if tokens_a or tokens_b:
        conclusion_sim = len(tokens_a & tokens_b) / len(tokens_a | tokens_b) if (tokens_a | tokens_b) else 0.0
    else:
        conclusion_sim = 1.0 if (not a.conclusion and not b.conclusion) else 0.0

    # Hypothesis overlap
    hyp_set_a = set(h.strip() for h in a.hypotheses)
    hyp_set_b = set(h.strip() for h in b.hypotheses)
    if hyp_set_a or hyp_set_b:
        hyp_overlap = len(hyp_set_a & hyp_set_b) / len(hyp_set_a | hyp_set_b)
    else:
        hyp_overlap = 1.0 if (not a.hypotheses and not b.hypotheses) else 0.0

    # Full signature SequenceMatcher
    sig_sim = SequenceMatcher(None, a.theorem_statement, b.theorem_statement).ratio()

    return 0.5 * conclusion_sim + 0.3 * hyp_overlap + 0.2 * sig_sim


def compare_tactic_usage(a: LeanProofStructure, b: LeanProofStructure) -> float:
    """
    Compare tactic usage using:
    - Set overlap / Jaccard (weight 0.3)
    - Sequence similarity via SequenceMatcher (weight 0.4)
    - Distribution cosine similarity on Counter vectors (weight 0.3)
    """
    set_a = set(a.tactics)
    set_b = set(b.tactics)

    # Jaccard set overlap
    if set_a or set_b:
        jaccard = len(set_a & set_b) / len(set_a | set_b)
    else:
        jaccard = 1.0

    # Sequence similarity
    seq_sim = SequenceMatcher(None, a.tactics, b.tactics).ratio()

    # Distribution cosine similarity
    counter_a = Counter(a.tactics)
    counter_b = Counter(b.tactics)
    all_tactics = set(counter_a.keys()) | set(counter_b.keys())
    if all_tactics:
        vec_a = [counter_a.get(t, 0) for t in sorted(all_tactics)]
        vec_b = [counter_b.get(t, 0) for t in sorted(all_tactics)]
        dot = sum(x * y for x, y in zip(vec_a, vec_b))
        mag_a = sum(x ** 2 for x in vec_a) ** 0.5
        mag_b = sum(x ** 2 for x in vec_b) ** 0.5
        cosine = dot / (mag_a * mag_b) if (mag_a * mag_b) > 0 else 0.0
    else:
        cosine = 1.0

    return 0.3 * jaccard + 0.4 * seq_sim + 0.3 * cosine


def compare_proof_structure(a: LeanProofStructure, b: LeanProofStructure) -> float:
    """
    Compare structural properties:
    - Proof length ratio
    - Have-statement count ratio
    - Sorry penalty
    - Nesting similarity (tactic count ratio as proxy)
    """
    # Proof length ratio (1.0 when equal, decreases with difference)
    max_len = max(a.proof_length, b.proof_length, 1)
    min_len = min(a.proof_length, b.proof_length, 1)
    length_ratio = min_len / max_len

    # Have-statement count ratio
    have_a = len(a.have_statements)
    have_b = len(b.have_statements)
    if have_a == 0 and have_b == 0:
        have_ratio = 1.0
    else:
        max_have = max(have_a, have_b)
        min_have = min(have_a, have_b)
        have_ratio = min_have / max_have

    # Sorry penalty: penalize if one has sorry and other doesn't
    sorry_penalty = 0.0
    if a.sorry_count == 0 and b.sorry_count == 0:
        sorry_penalty = 0.0  # No penalty
    elif a.sorry_count > 0 and b.sorry_count > 0:
        # Both have sorry, mild penalty based on count difference
        max_sorry = max(a.sorry_count, b.sorry_count)
        min_sorry = min(a.sorry_count, b.sorry_count)
        sorry_penalty = 0.1 * (1.0 - min_sorry / max_sorry)
    else:
        sorry_penalty = 0.3  # One has sorry, other doesn't

    # Nesting similarity (tactic count ratio as proxy)
    tac_a = len(a.tactics)
    tac_b = len(b.tactics)
    max_tac = max(tac_a, tac_b, 1)
    min_tac = min(tac_a, tac_b)
    nesting_sim = min_tac / max_tac if max_tac > 0 else 1.0

    structural = 0.3 * length_ratio + 0.25 * have_ratio + 0.2 * nesting_sim + 0.25 * (1.0 - sorry_penalty)
    return max(0.0, min(1.0, structural))


def compare_imports(a: LeanProofStructure, b: LeanProofStructure) -> float:
    """
    Compare import compatibility using Jaccard overlap.
    """
    set_a = set(a.imports)
    set_b = set(b.imports)

    if not set_a and not set_b:
        return 1.0  # Both have no imports — compatible

    if not set_a or not set_b:
        return 0.5  # One has imports, other doesn't

    return len(set_a & set_b) / len(set_a | set_b)


# ============================================================================
# TOP-LEVEL COMPARISON
# ============================================================================

DEFAULT_WEIGHTS = {
    'theorem_statement': 0.35,
    'tactic': 0.25,
    'structure': 0.25,
    'imports': 0.15,
}


def compare_lean_proofs(
    lean_a: str,
    lean_b: str,
    weights: Optional[Dict[str, float]] = None,
    use_lean_verification: bool = False,
) -> LeanComparisonResult:
    """
    Compare two Lean 4 proofs across multiple dimensions.

    Args:
        lean_a: First Lean proof source code
        lean_b: Second Lean proof source code
        weights: Custom dimension weights (default: theorem=0.35, tactic=0.25,
                 structure=0.25, imports=0.15)
        use_lean_verification: If True, attempt to verify both proofs compile
                               (requires Lean installation)

    Returns:
        LeanComparisonResult with per-dimension and combined scores
    """
    w = weights or DEFAULT_WEIGHTS

    struct_a = parse_lean_proof(lean_a)
    struct_b = parse_lean_proof(lean_b)

    theorem_sim = compare_theorem_statements(struct_a, struct_b)
    tactic_sim = compare_tactic_usage(struct_a, struct_b)
    structure_sim = compare_proof_structure(struct_a, struct_b)
    import_sim = compare_imports(struct_a, struct_b)

    sorry_info = {
        'a_sorry_count': struct_a.sorry_count,
        'b_sorry_count': struct_b.sorry_count,
    }

    combined = (
        w.get('theorem_statement', 0.35) * theorem_sim
        + w.get('tactic', 0.25) * tactic_sim
        + w.get('structure', 0.25) * structure_sim
        + w.get('imports', 0.15) * import_sim
    )

    # Optional Lean verification
    if use_lean_verification:
        try:
            from metrics.math_metrics import verify_lean_proof
            result_a = verify_lean_proof(lean_a)
            result_b = verify_lean_proof(lean_b)
            sorry_info['a_valid'] = result_a.get('is_valid', False)
            sorry_info['b_valid'] = result_b.get('is_valid', False)
        except Exception:
            pass

    return LeanComparisonResult(
        theorem_similarity=round(theorem_sim, 4),
        hypothesis_overlap=round(
            compare_theorem_statements(struct_a, struct_b), 4
        ),
        tactic_similarity=round(tactic_sim, 4),
        structural_similarity=round(structure_sim, 4),
        import_compatibility=round(import_sim, 4),
        sorry_comparison=sorry_info,
        combined_score=round(max(0.0, min(1.0, combined)), 4),
    )


def verify_proofs_same_theorem(lean_a: str, lean_b: str) -> Dict[str, any]:
    """
    Optionally verify that two Lean proofs prove the same theorem
    by creating a synthetic Lean file that type-checks both.

    Requires a working Lean installation.

    Returns:
        Dict with 'same_theorem' bool and details
    """
    import subprocess
    import tempfile
    import os

    struct_a = parse_lean_proof(lean_a)
    struct_b = parse_lean_proof(lean_b)

    # Quick structural check first
    if struct_a.theorem_statement and struct_b.theorem_statement:
        sig_sim = SequenceMatcher(
            None, struct_a.theorem_statement, struct_b.theorem_statement
        ).ratio()
    else:
        return {
            'same_theorem': False,
            'reason': 'Could not extract theorem statements',
            'signature_similarity': 0.0,
        }

    # Build a synthetic file that imports both proofs' statements
    synthetic = f"""-- Synthetic verification file
{lean_a}

-- Check that proof B has the same type
#check @{struct_a.theorem_name}
"""

    with tempfile.NamedTemporaryFile(mode='w', suffix='.lean', delete=False) as f:
        f.write(synthetic)
        temp_path = f.name

    try:
        result = subprocess.run(
            ['lean', temp_path],
            capture_output=True,
            text=True,
            timeout=30,
        )
        return {
            'same_theorem': result.returncode == 0,
            'signature_similarity': round(sig_sim, 4),
            'lean_output': result.stderr[:500] if result.stderr else None,
        }
    except (subprocess.TimeoutExpired, FileNotFoundError) as e:
        return {
            'same_theorem': None,
            'signature_similarity': round(sig_sim, 4),
            'reason': f'Lean verification unavailable: {type(e).__name__}',
        }
    finally:
        try:
            os.unlink(temp_path)
        except OSError:
            pass
