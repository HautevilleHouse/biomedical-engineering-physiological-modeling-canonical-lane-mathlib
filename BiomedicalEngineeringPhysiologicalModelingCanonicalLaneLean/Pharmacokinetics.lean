import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean

structure PharmacokineticPackage where
  drug : String
  absorptionRate : ℝ
  eliminationRate : ℝ
  volumeDistribution : ℝ
  bioavailability : ℝ
  modelValidated : Prop

structure PharmacokineticEvidence (P : PharmacokineticPackage) where
  modelValidatedClosed : P.modelValidated

def PharmacokineticClosed (P : PharmacokineticPackage) : Prop :=
  P.modelValidated

theorem pharmacokinetic_closed_from_evidence (P : PharmacokineticPackage) (E : PharmacokineticEvidence P) :
    PharmacokineticClosed P := by
  exact E.modelValidatedClosed

end BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean
end HautevilleHouse