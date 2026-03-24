import Mathlib.Data.Nat.Basic
import Mathlib.Tactic

open Nat

-- Problem: Prove that for all natural numbers n, n + 0 = n
theorem problem_2020_usamo_p6 (n : ℕ) : n + 0 = n := by
  -- Use reflexivity since this is definitional
  rfl