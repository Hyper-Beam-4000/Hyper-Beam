"""
Tests for metrics/lean_proof_comparison.py
"""

import sys
from pathlib import Path

# Add project root to Python path
project_root = Path(__file__).parent.parent.parent
if str(project_root) not in sys.path:
    sys.path.insert(0, str(project_root))

from metrics.lean_proof_comparison import (
    parse_lean_proof,
    compare_lean_proofs,
    compare_theorem_statements,
    compare_tactic_usage,
    compare_proof_structure,
    compare_imports,
    LeanProofStructure,
    LeanComparisonResult,
    _extract_tactics,
    _extract_theorem_signature,
    _extract_hypotheses,
)
from tests.metrics.test_data import (
    LEAN_PROOF_SIMPLE,
    LEAN_PROOF_SIMPLE_ALT,
    LEAN_PROOF_STRUCTURED,
    LEAN_PROOF_WITH_SORRY,
    LEAN_PROOF_DIFFERENT_THEOREM,
    LEAN_PROOF_COMPLEX,
    LEAN_PROOF_NO_IMPORTS,
    LEAN_PROOF_EMPTY,
)


# ============================================================================
# PARSING TESTS
# ============================================================================

class TestParseLeanProof:
    def test_parse_simple_proof(self):
        """Parse a simple Lean proof and verify extracted fields."""
        result = parse_lean_proof(LEAN_PROOF_SIMPLE)

        assert isinstance(result, LeanProofStructure)
        assert result.theorem_name == "simple_add_comm"
        assert "Mathlib.Tactic" in result.imports
        assert result.sorry_count == 0
        assert result.proof_length > 0
        assert "omega" in result.tactics

    def test_parse_structured_proof(self):
        """Parse a structured proof with have-statements and hypotheses."""
        result = parse_lean_proof(LEAN_PROOF_STRUCTURED)

        assert result.theorem_name == "structured_example"
        assert len(result.imports) >= 1
        assert len(result.opens) >= 1  # open Nat
        assert "Nat" in result.opens[0]
        # Should find hypotheses like (n : Nat) and (h : n > 0)
        assert len(result.hypotheses) >= 1
        # Should find have statements
        assert len(result.have_statements) >= 1
        assert "linarith" in result.tactics

    def test_parse_sorry_proof(self):
        """Parse a proof with sorry and verify sorry detection."""
        result = parse_lean_proof(LEAN_PROOF_WITH_SORRY)

        assert result.sorry_count == 1
        assert len(result.sorry_positions) == 1
        assert "sorry" in result.tactics

    def test_parse_empty_proof(self):
        """Parse empty input gracefully."""
        result = parse_lean_proof(LEAN_PROOF_EMPTY)

        assert result.theorem_name == ""
        assert result.tactics == []
        assert result.sorry_count == 0
        assert result.imports == []

    def test_parse_no_imports(self):
        """Parse a proof with no imports."""
        result = parse_lean_proof(LEAN_PROOF_NO_IMPORTS)

        assert result.imports == []
        assert result.theorem_name == "no_imports"
        assert "rfl" in result.tactics


# ============================================================================
# EXTRACTION TESTS
# ============================================================================

class TestExtractionFunctions:
    def test_extract_theorem_signature(self):
        """Extract theorem name and signature."""
        name, statement, conclusion = _extract_theorem_signature(LEAN_PROOF_SIMPLE)
        assert name == "simple_add_comm"
        assert "Nat" in statement
        assert "a + b = b + a" in conclusion or "+" in conclusion

    def test_extract_hypotheses(self):
        """Extract hypotheses from theorem signature."""
        hyps = _extract_hypotheses(LEAN_PROOF_STRUCTURED)
        assert len(hyps) >= 1
        # Should find (n : Nat) and/or (h : n > 0)
        hyp_text = ' '.join(hyps)
        assert 'Nat' in hyp_text

    def test_extract_tactics(self):
        """Extract tactics from proof body."""
        tactics = _extract_tactics(LEAN_PROOF_SIMPLE_ALT)
        assert "induction" in tactics
        assert "simp" in tactics

    def test_extract_tactics_complex(self):
        """Extract tactics from a complex proof."""
        tactics = _extract_tactics(LEAN_PROOF_COMPLEX)
        assert "intro" in tactics
        assert "omega" in tactics


# ============================================================================
# COMPARISON TESTS
# ============================================================================

class TestComparisonFunctions:
    def test_compare_identical_proofs(self):
        """Comparing identical proofs should give high similarity."""
        result = compare_lean_proofs(LEAN_PROOF_SIMPLE, LEAN_PROOF_SIMPLE)

        assert result.combined_score >= 0.9
        assert result.theorem_similarity >= 0.9
        assert result.tactic_similarity >= 0.9
        assert result.import_compatibility >= 0.9

    def test_compare_same_theorem_different_tactics(self):
        """Same theorem with different tactic proofs."""
        result = compare_lean_proofs(LEAN_PROOF_SIMPLE, LEAN_PROOF_SIMPLE_ALT)

        # Theorem statement should be very similar
        assert result.theorem_similarity >= 0.7
        # Tactics should differ
        assert result.tactic_similarity < 0.9
        # Overall should be moderate
        assert 0.3 < result.combined_score < 1.0

    def test_compare_different_theorems(self):
        """Different theorems should have lower similarity."""
        result = compare_lean_proofs(LEAN_PROOF_SIMPLE, LEAN_PROOF_DIFFERENT_THEOREM)

        # Theorem statements differ (+ vs *)
        assert result.theorem_similarity < 1.0
        # Overall should be lower than identical
        assert result.combined_score < 0.95

    def test_compare_sorry_vs_complete(self):
        """Proof with sorry vs complete proof."""
        result = compare_lean_proofs(LEAN_PROOF_WITH_SORRY, LEAN_PROOF_SIMPLE)

        # Should detect sorry difference
        assert result.sorry_comparison['a_sorry_count'] == 1
        assert result.sorry_comparison['b_sorry_count'] == 0
        # Structural similarity should be affected
        assert result.structural_similarity < 1.0

    def test_compare_import_compatibility(self):
        """Test import compatibility scoring."""
        struct_a = parse_lean_proof(LEAN_PROOF_SIMPLE)
        struct_b = parse_lean_proof(LEAN_PROOF_NO_IMPORTS)

        score = compare_imports(struct_a, struct_b)
        # One has imports, other doesn't — should be 0.5
        assert score == 0.5

    def test_compare_same_imports(self):
        """Same imports should give high compatibility."""
        struct_a = parse_lean_proof(LEAN_PROOF_SIMPLE)
        struct_b = parse_lean_proof(LEAN_PROOF_SIMPLE_ALT)

        score = compare_imports(struct_a, struct_b)
        assert score == 1.0  # Both import Mathlib.Tactic

    def test_compare_empty_proofs(self):
        """Empty proofs should not crash."""
        result = compare_lean_proofs(LEAN_PROOF_EMPTY, LEAN_PROOF_EMPTY)

        assert isinstance(result, LeanComparisonResult)
        assert 0.0 <= result.combined_score <= 1.0

    def test_custom_weights(self):
        """Test custom comparison weights."""
        custom_weights = {
            'theorem_statement': 0.5,
            'tactic': 0.2,
            'structure': 0.2,
            'imports': 0.1,
        }
        result = compare_lean_proofs(
            LEAN_PROOF_SIMPLE,
            LEAN_PROOF_SIMPLE_ALT,
            weights=custom_weights,
        )
        assert isinstance(result, LeanComparisonResult)
        assert 0.0 <= result.combined_score <= 1.0

    def test_tactic_distribution_similarity(self):
        """Compare tactic usage distributions."""
        struct_a = parse_lean_proof(LEAN_PROOF_STRUCTURED)
        struct_b = parse_lean_proof(LEAN_PROOF_COMPLEX)

        score = compare_tactic_usage(struct_a, struct_b)
        assert 0.0 <= score <= 1.0
