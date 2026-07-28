import HautevilleHouse.BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.conclusion.1 ∨ A.object.conclusion.2

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  let h : A.object.experimentsValidated ∧ A.object.inferenceConverges := A.object.conclusion
  exact Or.inl h.1

end BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean
end HautevilleHouse