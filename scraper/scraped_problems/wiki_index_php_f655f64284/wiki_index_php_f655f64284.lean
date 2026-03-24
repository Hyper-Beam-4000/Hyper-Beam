import Mathlib.Geometry.Euclidean.Circumcircle
import Mathlib.Geometry.Euclidean.IncenterExcenter
import Mathlib.Tactic

open EuclideanGeometry

-- Problem: Given the conditions in the problem, prove that ∠BAD = ∠EAC
theorem usamo_2023_p6 (A B C I I_a I_b I_c D F E : Point)
  (hI : is_incenter A B C I)
  (hI_a : is_excenter A B C I_a)
  (hI_b : is_excenter B A C I_b)
  (hI_c : is_excenter C A B I_c)
  (hD_on_circumcircle : D ∈ circumcircle A B C)
  (hD_not_on_lines : D ∉ line_through I I_a ∧ D ∉ line_through I_b I_c ∧ D ∉ line_through B C)
  (hF_on_circumcircles : F ∈ circumcircle D I I_a ∧ F ∈ circumcircle D I_b I_c)
  (hE_intersection : E = line_intersection (line_through D F) (line_through B C)) :
  ∠BAD = ∠EAC := by
  -- Introduce the given conditions and assumptions
  intro hI hI_a hI_b hI_c hD_on_circumcircle hD_not_on_lines hF_on_circumcircles hE_intersection

  -- Step 1: Establish that D, I, I_a, and F are concyclic
  have h_concyclic_DIIF : F ∈ circumcircle D I I_a := by
    exact hF_on_circumcircles.1

  -- Step 2: Establish that D, I_b, I_c, and F are concyclic
  have h_concyclic_DIbcF : F ∈ circumcircle D I_b I_c := by
    exact hF_on_circumcircles.2

  -- Step 3: Use the properties of cyclic quadrilaterals and angles
  -- This is a complex step involving angle chasing and cyclic properties
  -- We will use `sorry` to indicate the detailed geometric reasoning required
  sorry

  -- Step 4: Conclude the angle equality using the established properties
  -- The final step involves showing that the angles are equal through cyclic properties
  sorry

  -- The proof outline is complete, but detailed geometric reasoning is required
  sorry