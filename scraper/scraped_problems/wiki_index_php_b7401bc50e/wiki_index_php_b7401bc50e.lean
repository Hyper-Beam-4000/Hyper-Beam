import Mathlib.Data.Nat.Basic
import Mathlib.Data.Nat.Prime
import Mathlib.Tactic

open Nat

-- Theorem: For a prime p and integers a_1, ..., a_p, there exists an integer k such that
-- the numbers a_1 + k, a_2 + 2k, ..., a_p + pk produce at least ⌊p/2⌋ distinct remainders modulo p.
theorem usamo_2018_p4 (p : ℕ) (hp : Prime p) (a : Fin p → ℤ) :
  ∃ k : ℤ, (Finset.univ.image (λ i, (a i + i * k) % p)).card ≥ p / 2 := by
  -- We will use a graph-theoretic argument to show the existence of such k.
  -- Consider graphs G_k for k = 0, 1, ..., p-1 where vertices i and j are connected if
  -- a_i + i*k ≡ a_j + j*k (mod p).
  let G : Fin p → Finset (Fin p × Fin p) := λ k,
    Finset.univ.filter (λ (i, j), i < j ∧ (a i + i * k) % p = (a j + j * k) % p)

  -- Each G_k has exactly one edge for each unordered pair (i, j) where i ≠ j.
  have h_edges : ∑ k, (G k).card = p * (p - 1) / 2 := by
    sorry

  -- By the pigeonhole principle, there exists some k such that G_k has fewer than p/2 edges.
  obtain ⟨k, hk⟩ : ∃ k, (G k).card < p / 2 := by
    sorry

  -- For this k, the number of connected components in G_k is at least p - (p/2) = p/2.
  -- Hence, the number of distinct remainders is at least p/2.
  use k
  have h_components : (Finset.univ.image (λ i, (a i + i * k) % p)).card ≥ p / 2 := by
    sorry

  exact h_components