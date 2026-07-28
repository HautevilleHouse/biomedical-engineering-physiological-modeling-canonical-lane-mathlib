import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean

structure PharmacokineticModelPackage where
  absorptionModel : Type u
  distributionModel : Type v
  eliminationRate : Prop
  areaUnderCurveFormula : Prop
  bioavailabilityDefined : Prop

structure PharmacokineticModelEvidence (P : PharmacokineticModelPackage) where
  eliminationRateClosed : P.eliminationRate
  areaUnderCurveFormulaClosed : P.areaUnderCurveFormula
  bioavailabilityDefinedClosed : P.bioavailabilityDefined

def PharmacokineticModelClosed (P : PharmacokineticModelPackage) : Prop :=
  P.eliminationRate ∧ P.areaUnderCurveFormula ∧ P.bioavailabilityDefined

theorem pharmacokinetic_model_closed_from_evidence (P : PharmacokineticModelPackage)
    (E : PharmacokineticModelEvidence P) : PharmacokineticModelClosed P :=
  And.intro E.eliminationRateClosed
    (And.intro E.areaUnderCurveFormulaClosed E.bioavailabilityDefinedClosed)

end BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean
end HautevilleHouse