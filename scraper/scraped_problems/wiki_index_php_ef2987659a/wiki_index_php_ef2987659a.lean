import Mathlib.Data.Real.Basic
import Mathlib.Tactic

open Real

-- Problem: Given a positive integer \( n \), let \( a_1, a_2, \ldots, a_n \) be positive real numbers such that \( a_1 a_2 \cdots a_n = 1 \).
-- Prove that \(\sum_{i=1}^{n} \frac{1}{1 + a_i} \leq \frac{n}{2}\).

theorem usamo_2021_p5 (n : ℕ) (a : Fin n → ℝ) (h : (∏ i, a i) = 1) (h_pos : ∀ i, 0 < a i) : 
  (∑ i, 1 / (1 + a i)) ≤ n / 2 := by
  -- Use the AM-GM inequality to relate the sum and product
  have am_gm : (∑ i, a i) / n ≥ (∏ i, a i) ^ (1 / n) := sorry
  -- Since the product is 1, the AM-GM inequality simplifies
  rw [h] at am_gm
  -- Simplify the inequality
  have am_gm_simplified : (∑ i, a i) / n ≥ 1 := by
    rw [Real.rpow_one] at am_gm
    exact am_gm
  -- Use the fact that \( \frac{1}{1 + x} \leq 1 - \frac{x}{2} \) for \( x > 0 \)
  have key_inequality : ∀ x > 0, 1 / (1 + x) ≤ 1 - x / 2 := sorry
  -- Apply the key inequality to each term in the sum
  have sum_inequality : ∑ i, 1 / (1 + a i) ≤ ∑ i, (1 - a i / 2) := by
    apply Finset.sum_le_sum
    intro i _
    apply key_inequality
    apply h_pos
  -- Simplify the right-hand side of the inequality
  rw [Finset.sum_sub_distrib, Finset.sum_const, nsmul_eq_mul, mul_one] at sum_inequality
  -- Combine with the AM-GM inequality
  have final_inequality : ∑ i, (1 - a i / 2) ≤ n - (∑ i, a i) / 2 := by
    rw [← mul_div_assoc, ← Finset.sum_div]
    apply sub_le_sub_left
    apply div_le_div_of_le_of_nonneg
    exact am_gm_simplified
    norm_num
  -- Conclude the proof
  rw [← sub_le_iff_le_add] at final_inequality
  exact le_trans sum_inequality final_inequality
  -- The proof is complete
  sorry