import Mathlib.Data.Finset
import Mathlib.Data.Polynomial
import Mathlib.Tactic

open Finset Polynomial

-- Problem: For each integer n ≥ 2, find the largest integer k such that
-- there exists a set of n distinct points that is not overdetermined,
-- but has k overdetermined subsets.

theorem usamo2020_p5 (n : ℕ) (hn : n ≥ 2) : ∃ S : Finset (ℝ × ℝ), S.card = n ∧
  (∃ k : ℕ, k = 2^(n - 1) - n ∧ ∀ T ⊆ S, T.card ≥ 2 → 
  (∃ P : Polynomial ℝ, P.degree ≤ T.card - 2 ∧ ∀ (x, y) ∈ T, P.eval x = y) ↔ T.card ≤ k) := by
  -- Construct a set S of n points with n-1 points on a horizontal line
  -- and 1 point not on it
  let S := (range (n - 1)).image (λ x, (x : ℝ, 0)) ∪ {(0, 1)}
  have hS_card : S.card = n := by
    -- Prove that S has n elements
    sorry

  -- Show that any subset of S that does not include the point (0, 1) is overdetermined
  have overdetermined_subsets : ∀ T ⊆ S, T.card ≥ 2 → 
    (∃ P : Polynomial ℝ, P.degree ≤ T.card - 2 ∧ ∀ (x, y) ∈ T, P.eval x = y) ↔ T ≠ S := by
    sorry

  -- Calculate the number of overdetermined subsets
  have k_value : ∃ k : ℕ, k = 2^(n - 1) - n ∧ ∀ T ⊆ S, T.card ≥ 2 → 
    (∃ P : Polynomial ℝ, P.degree ≤ T.card - 2 ∧ ∀ (x, y) ∈ T, P.eval x = y) ↔ T.card ≤ k := by
    sorry

  -- Combine the results to show the existence of such a set S and integer k
  exact ⟨S, hS_card, k_value⟩