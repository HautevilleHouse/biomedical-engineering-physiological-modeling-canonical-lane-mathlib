import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean

structure CompartmentModelPackage where
  numCompartments : Nat
  transferRates : Array (Array ℝ)
  initialConditions : Array ℝ
  solutionDefined : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  solutionDefinedClosed : C.solutionDefined

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.solutionDefined

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage) (E : CompartmentModelEvidence C) :
    CompartmentModelClosed C := by
  exact E.solutionDefinedClosed

end BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean
end HautevilleHouse