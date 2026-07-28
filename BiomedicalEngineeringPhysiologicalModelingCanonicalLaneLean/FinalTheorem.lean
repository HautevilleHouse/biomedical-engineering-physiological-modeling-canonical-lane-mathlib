import HautevilleHouse.BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean

def ConstrainedBiomedicalClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_biomedical_endgame (A : AdmissibleClass) :
    ConstrainedBiomedicalClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean
end HautevilleHouse