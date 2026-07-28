import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean

structure PhysiologicalModel where
  carrier : Type
  parameters : Type
  compartments : Nat
  initialConditions : parameters -> carrier
  differentialEquations : Prop

definition PhysiologicalAdmittedObject where
  object : PhysiologicalModel
  experimentsValidated : Prop
  inferenceConverges : Prop
  conclusion : experimentsValidated ∧ inferenceConverges

structure AdmissibleClass where
  object : PhysiologicalAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.conclusion) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean
end HautevilleHouse