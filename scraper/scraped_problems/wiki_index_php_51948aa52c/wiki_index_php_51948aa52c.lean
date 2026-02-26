import Mathlib.Data.Nat.Prime
import Mathlib.FieldTheory.Finite
import Mathlib.Data.Finset.Basic
import Mathlib.Algebra.Field.Basic
import Mathlib.Data.Int.Basic

open Nat

-- Problem: Calculate the remainder when the product of the elements of A is divided by an odd prime p
theorem product_of_quadratic_non_residues (p : ℕ) (hp : p ≠ 2) (hprime : Nat.Prime p) : 
  (∃ A : Finset ℕ, (∀ a ∈ A, 1 ≤ a ∧ a < p ∧ is_quadratic_non_residue a p) ∧ 
  (∀ a ∈ A, is_quadratic_non_residue (4 - a) p) → 
  (∏ a in A, a) % p = 2) := by
  -- We will consider two cases based on the congruence of p modulo 4
  by_cases hp4 : p % 4 = 3
  -- Case 1: p ≡ 3 (mod 4)
  case inl =>
    -- Construct the field F_p[i]
    have : F := FiniteField.of_prime p
    let A := { a | 1 ≤ a ∧ a < p ∧ is_quadratic_non_residue a p ∧ is_quadratic_non_residue (4 - a) p }
    -- Show that A has the desired properties
    have hA : ∀ a ∈ A, a = (t + 1/t)^2 for some t in F such that t^(p + 1) + 1 = 0
    -- Prove the product T
    let T := (-1)^( (p + 1) / 4) * ∏ (t : F) in { t | t^( (p + 1) / 2) - i = 0 }, (t + 1/t)
    -- Show that T mod p equals 2
    have : T % p = 2
    -- Use Frobenius and properties of roots
    sorry

  -- Case 2: p ≡ 1 (mod 4)
  case inr =>
    -- Construct the field F_p[ω] where ω is a square root of a quadratic non-residue
    let ω := some_non_residue p
    let A := { a | 1 ≤ a ∧ a < p ∧ is_quadratic_non_residue a p ∧ is_quadratic_non_residue (4 - a) p }
    -- Show that A has the desired properties
    have hA : ∀ a ∈ A, a = (t + 1/t)^2 for some t in F such that t^(p - 1) + 1 = 0
    -- Prove the product T
    let T := (-1)^( (p - 1) / 4) * ∏ (t : F) in { t | t^( (p - 1) / 2) - i = 0 }, (t + 1/t)
    -- Show that T mod p equals 2
    have : T % p = 2
    -- Use Frobenius and properties of roots
    sorry

  -- Conclude that the product of elements of A modulo p is 2
  exact ⟨A, hA, this⟩

-- Helper function to determine if a number is a quadratic non-residue modulo p
def is_quadratic_non_residue (a p : ℕ) : Prop :=
  ∀ t : ℕ, ¬ (t * t ≡ a [MOD p])