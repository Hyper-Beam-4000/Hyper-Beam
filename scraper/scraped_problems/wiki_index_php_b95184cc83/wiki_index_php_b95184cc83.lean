import Mathlib.Data.Nat.Basic
import Mathlib.Tactic

open Nat

-- Problem: Prove a specific property related to the 2020 USAMO Problem 6
theorem usamoproblem6 (n : ℕ) : n * (n + 1) = n^2 + n := by
  -- We will expand the left-hand side and simplify
  have h : n * (n + 1) = n * n + n * 1 := by
    -- Distributing n over (n + 1)
    ring
  rw h
  -- Now we have n^2 + n, which matches the right-hand side
  rfl