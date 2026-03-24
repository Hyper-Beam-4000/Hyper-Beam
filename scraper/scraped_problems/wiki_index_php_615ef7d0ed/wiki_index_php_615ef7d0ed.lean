import Mathlib.Data.Nat.Basic
import Mathlib.Tactic

open Nat

-- Problem: Find all possible values for the number of elements of a set S with the given properties
theorem usamo_2021_p4 (S : Finset ℕ) (h : ∀ s ∈ S, ∀ d ∣ s, ∃! t ∈ S, gcd s t = d) : 
  S.card = 1 := by
  -- Strategy: Show that if S has more than one element, it leads to a contradiction
  by_contra h_card
  -- Assume that S has more than one element
  have h_nontrivial : S.card > 1 := by
    rw [Finset.card_pos] at h_card
    exact h_card

  -- Obtain two distinct elements from S
  obtain ⟨a, ha⟩ := Finset.exists_mem_of_card_gt_one h_nontrivial
  obtain ⟨b, hb, hne⟩ := Finset.exists_ne_of_card_gt_one h_nontrivial ha

  -- Consider the divisors of a
  have h_div_a : ∀ d ∣ a, ∃! t ∈ S, gcd a t = d := h a ha

  -- Consider the divisor 1 of a
  have h_div_1 : ∃! t ∈ S, gcd a t = 1 := h_div_a 1 (one_dvd a)

  -- Since gcd a a = a, a cannot be the unique element with gcd a t = 1
  have h_gcd_a_a : gcd a a = a := gcd_self a
  have h_a_ne_1 : a ≠ 1 := by
    intro h_eq
    rw [h_eq] at h_gcd_a_a
    have : gcd 1 a = 1 := gcd_one_right a
    rw [h_gcd_a_a] at this
    exact Nat.not_lt_zero 1 (lt_of_le_of_ne (Nat.zero_le 1) (ne.symm this))

  -- Therefore, there must be another element t ≠ a such that gcd a t = 1
  obtain ⟨t, htS, h_gcd⟩ := h_div_1
  have h_t_ne_a : t ≠ a := by
    intro h_eq
    rw [h_eq] at h_gcd
    exact h_a_ne_1 h_gcd

  -- This contradicts the uniqueness condition for the divisor 1
  exact h_gcd (gcd_one_right a) ha

  -- Conclude that S must have exactly one element
  exact absurd h_nontrivial (lt_irrefl 1)