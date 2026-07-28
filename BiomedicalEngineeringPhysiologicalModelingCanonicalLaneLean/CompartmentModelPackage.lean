import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.PhysiologicalModelingCanonicalLaneLean.PhysiologicalModelObjects

namespace HautevilleHouse
namespace PhysiologicalModelingCanonicalLaneLean

structure CompartmentModelPackage {P : PhysiologicalAdmittedObject} where
  compartments : Type u
  flowRates : Type v
  massBalanceEquations : Prop
  initialConditionsSet : Prop
  parametersIdentified : P.parametersIdentified

structure CompartmentModelEvidence {P : PhysiologicalAdmittedObject} (C : CompartmentModelPackage P) where
  massBalanceEquationsClosed : C.massBalanceEquations
  initialConditionsSetClosed : C.initialConditionsSet
  parametersIdentifiedClosed : C.parametersIdentified

def CompartmentModelClosed {P : PhysiologicalAdmittedObject} (C : CompartmentModelPackage P) : Prop :=
  C.massBalanceEquations ∧ C.initialConditionsSet ∧ C.parametersIdentified

theorem compartment_model_closed_from_evidence {P : PhysiologicalAdmittedObject} (C : CompartmentModelPackage P) (E : CompartmentModelEvidence C) :
  CompartmentModelClosed C := by
  exact And.intro E.massBalanceEquationsClosed (And.intro E.initialConditionsSetClosed E.parametersIdentifiedClosed)

end PhysiologicalModelingCanonicalLaneLean
end HautevilleHouse