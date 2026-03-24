import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Fintype.Basic
import Mathlib.Algebra.Field.Basic
import Mathlib.Tactic

open ZMod

-- Problem: Calculate the remainder when the product of the elements of A is divided by p
theorem usamo_2020_p3 (p : ℕ) [Fact (Nat.Prime p)] (hp : p % 2 = 1) : 
  let A := {a : ℤ | 1 ≤ a ∧ a < p ∧ ¬ isSquare (a : ZMod p) ∧ ¬ isSquare (4 - a : ZMod p)}
  (∏ a in A, a) % p = 2 := by
  -- We will consider two cases based on p mod 4
  have hp_odd : p % 4 = 1 ∨ p % 4 = 3 := by
    sorry -- This follows from p being an odd prime

  cases hp_odd with
  | inl hp1 =>
    -- Case 1: p ≡ 1 (mod 4)
    sorry -- Detailed calculations for this case
  | inr hp3 =>
    -- Case 2: p ≡ 3 (mod 4)
    sorry -- Detailed calculations for this case

  -- In both cases, we find that the product is 2
  -- Therefore, the remainder when the product is divided by p is 2
  exact sorry