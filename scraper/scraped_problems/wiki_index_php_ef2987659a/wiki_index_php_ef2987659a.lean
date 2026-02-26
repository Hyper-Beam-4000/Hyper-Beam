import Mathlib.Data.Nat.Basic
import Mathlib.Data.Nat.Prime
import Mathlib.Tactic

open Nat

-- Problem: Let n be a positive integer. Prove that if n is not a prime number, then there exist integers a and b such that n = a * b and 1 < a, b < n.
theorem usamo_problem_2021_5 (n : ℕ) (h : n > 1 ∧ ¬ Nat.Prime n) : ∃ a b : ℕ, a * b = n ∧ 1 < a ∧ 1 < b ∧ a < n ∧ b < n := by
  -- Since n is not prime, it has divisors other than 1 and itself
  obtain ⟨a, b, hab⟩ := Nat.exists_factor h.2
  -- We know a * b = n
  use [a, b]
  -- We need to show that 1 < a, 1 < b, a < n, and b < n
  have : 1 < a ∧ 1 < b := by
    -- Since a and b are factors of n and n > 1, both must be greater than 1
    exact ⟨Nat.le_of_dvd (Nat.pos_of_gt h.1) (Nat.dvd_mul_left _ _), Nat.le_of_dvd (Nat.pos_of_gt h.1) (Nat.dvd_mul_right _ _)⟩
  -- Now we need to show a < n and b < n
  have : a < n ∧ b < n := by
    -- Since a and b are factors of n, they must be less than n
    exact ⟨Nat.lt_of_le_of_ne (Nat.le_of_dvd (Nat.pos_of_gt h.1) (Nat.dvd_mul_left _ _)) (ne_of_gt h.1), Nat.lt_of_le_of_ne (Nat.le_of_dvd (Nat.pos_of_gt h.1) (Nat.dvd_mul_right _ _)) (ne_of_gt h.1)⟩
  -- Combine all parts to conclude the proof
  exact ⟨hab, this.1, this.2⟩
  
  -- Note: The proof relies on the existence of factors and their properties. The specific details of the factorization are handled by theorems in Mathlib.