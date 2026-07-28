import HautevilleHouse.BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean

structure CompartmentModelPackage (M : PhysiologicalModel) where
  compartmentsIdentified : Prop
  rateConstantsMeasured : Prop
  massBalanceSatisfied : Prop
  steadyStateReached : Prop

structure CompartmentModelEvidence (M : PhysiologicalModel) (C : CompartmentModelPackage M) where
  compartmentsIdentifiedClosed : C.compartmentsIdentified
  rateConstantsMeasuredClosed : C.rateConstantsMeasured
  massBalanceSatisfiedClosed : C.massBalanceSatisfied
  steadyStateReachedClosed : C.steadyStateReached

def CompartmentModelClosed (M : PhysiologicalModel) (C : CompartmentModelPackage M) : Prop :=
  C.compartmentsIdentified ∧ C.rateConstantsMeasured ∧ C.massBalanceSatisfied ∧ C.steadyStateReached

theorem compartment_model_closed_from_evidence (M : PhysiologicalModel) (C : CompartmentModelPackage M) (E : CompartmentModelEvidence M C) :
    CompartmentModelClosed M C := by
  exact And.intro E.compartmentsIdentifiedClosed
    (And.intro E.rateConstantsMeasuredClosed
      (And.intro E.massBalanceSatisfiedClosed E.steadyStateReachedClosed))

end BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean
end HautevilleHouse