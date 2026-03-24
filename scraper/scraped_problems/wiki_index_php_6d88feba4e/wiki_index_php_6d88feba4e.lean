import Mathlib.Data.Nat.Basic
import Mathlib.Data.Polynomial
import Mathlib.Tactic

open Polynomial

-- Define the set K of positive integers not containing the digit 7
def K (n : ℕ) : Prop :=
  ∀ d ∈ n.digits 10, d ≠ 7

-- The main theorem: Characterize polynomials with nonnegative integer coefficients
-- such that f(n) ∈ K whenever n ∈ K
theorem characterize_polynomials (f : Polynomial ℕ) :
  (∀ n, K n → K (f.eval n)) ↔
  (∃ (k : ℕ), K k ∧ f = Polynomial.C k) ∨
  (∃ (a b : ℕ), a > 0 ∧ b < a ∧ K b ∧ f = Polynomial.C a * Polynomial.X + Polynomial.C b) := by
  constructor
  · intro h
    -- Case 1: f is a constant polynomial
    by_cases hc : f.degree = 0
    · obtain ⟨k, hk⟩ := exists_eq_C_of_degree_eq_zero hc
      left
      use k
      constructor
      · -- Show k ∈ K
        specialize h 1 (by simp [K])
        rw [hk, eval_C] at h
        exact h
      · exact hk
    -- Case 2: f is a non-constant polynomial
    right
    -- Assume f is of the form an + b
    sorry
  · intro h
    cases h
    · -- Case: f is a constant polynomial
      obtain ⟨k, hk, rfl⟩ := h
      intro n hn
      rw [eval_C]
      exact hk
    · -- Case: f is of the form an + b
      obtain ⟨a, b, ha, hb, hbK, rfl⟩ := h
      intro n hn
      rw [eval_add, eval_mul, eval_C, eval_X]
      -- Show that an + b ∈ K
      sorry