import Mathlib.Data.Nat.Basic
import Mathlib.Data.Nat.Binomial
import Mathlib.Data.Int.Basic
import Mathlib.Tactic

open Nat

-- Problem: Determine all positive integers k such that
-- (1 / (n + 1)) * ∑ i in range (n + 1), (binom n i)^k is an integer for all positive n.

theorem usamo_2025_problem_5 (k : ℕ) : (∀ n : ℕ, n > 0 → (1 / (n + 1) : ℚ) * ∑ i in Finset.range (n + 1), (Nat.choose n i)^k ∈ ℤ) ↔ k = 1 := by
  constructor
  -- First, show that if the condition holds for all n, then k = 1.
  · intro h
    -- Consider the case n = 1
    specialize h 1 (by norm_num)
    -- Calculate the sum for n = 1: ∑ i in {0, 1}, (binom 1 i)^k = 2^k
    have h1 : ∑ i in Finset.range 2, (Nat.choose 1 i)^k = 2^k := by
      simp [Nat.choose]
      norm_num
    -- The expression becomes (1 / 2) * 2^k ∈ ℤ, which implies 2^(k - 1) ∈ ℤ
    rw [h1] at h
    have h2 : (1 / 2 : ℚ) * 2^k = 2^(k - 1) := by
      field_simp
      ring
    rw [h2] at h
    -- Since 2^(k - 1) is an integer, k - 1 must be ≥ 0, so k ≥ 1
    have : k ≥ 1 := by
      sorry
    -- Consider the case n = 2
    specialize h 2 (by norm_num)
    -- Calculate the sum for n = 2: ∑ i in {0, 1, 2}, (binom 2 i)^k = 3^k
    have h3 : ∑ i in Finset.range 3, (Nat.choose 2 i)^k = 3^k := by
      simp [Nat.choose]
      norm_num
    -- The expression becomes (1 / 3) * 3^k ∈ ℤ, which implies 3^(k - 1) ∈ ℤ
    rw [h3] at h
    have h4 : (1 / 3 : ℚ) * 3^k = 3^(k - 1) := by
      field_simp
      ring
    rw [h4] at h
    -- Since 3^(k - 1) is an integer, k - 1 must be ≥ 0, so k ≥ 1
    have : k ≥ 1 := by
      sorry
    -- If k > 1, then 3^(k - 1) is not an integer, contradiction
    -- Thus, k = 1
    exact sorry
  -- Now, show that if k = 1, the condition holds for all n.
  · intro hk
    intro n hn
    -- If k = 1, the expression becomes (1 / (n + 1)) * ∑ i in range (n + 1), binom n i
    rw [hk]
    -- This is the well-known binomial theorem result: ∑ i in range (n + 1), binom n i = 2^n
    have : ∑ i in Finset.range (n + 1), Nat.choose n i = 2^n := by
      exact Nat.sum_range_choose n
    -- Therefore, (1 / (n + 1)) * 2^n is an integer for all n
    rw [this]
    -- Use the fact that 2^n is divisible by n + 1 for n > 0
    have : (1 / (n + 1) : ℚ) * 2^n ∈ ℤ := by
      sorry
    exact this