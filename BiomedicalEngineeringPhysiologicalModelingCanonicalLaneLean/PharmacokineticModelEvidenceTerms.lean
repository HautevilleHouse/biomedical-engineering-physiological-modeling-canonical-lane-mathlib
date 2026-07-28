import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.PhysiologicalModelingCanonicalLaneLean.CompartmentModelPackage

namespace HautevilleHouse
namespace PhysiologicalModelingCanonicalLaneLean

structure PharmacokineticEvidenceTerms {P : PhysiologicalAdmittedObject} {C : CompartmentModelPackage P} (PK : PharmacokineticCertificate C) where
  absorptionRate : PK.absorptionRate
  distributionVolume : PK.distributionVolume
  eliminationRate : PK.eliminationRate
  modelFitClosed : PK.modelFit
  pharmacokineticClosed : PharmacokineticClosed C

def PharmacokineticAnalyticCertificate {P : PhysiologicalAdmittedObject} {C : CompartmentModelPackage P} (PK : PharmacokineticEvidenceTerms C) : Prop :=
  PK.absorptionRate ∧ PK.distributionVolume ∧ PK.eliminationRate ∧ PK.modelFitClosed

theorem pharmacokinetic_certificate_closed {P : PhysiologicalAdmittedObject} {C : CompartmentModelPackage P} (PK : PharmacokineticEvidenceTerms C) :
  PharmacokineticAnalyticCertificate PK := by
  exact And.intro PK.absorptionRate (And.intro PK.distributionVolume (And.intro PK.eliminationRate PK.modelFitClosed))

end PhysiologicalModelingCanonicalLaneLean
end HautevilleHouse