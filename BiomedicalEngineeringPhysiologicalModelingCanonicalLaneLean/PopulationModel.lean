import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean

structure PopulationModel where
  randomEffects : List Float
  fixedEffects : List Float
  betweenSubjectVariability : List Float
  residualError : Float
  modelConverged : Prop
  valid : Prop

structure PopulationModelEvidence (P : PopulationModel) where
  randomEffectsFinite : ∀ re ∈ P.randomEffects, re ≠ ∞ ∧ re ≠ -∞
  fixedEffectsFinite : ∀ fe ∈ P.fixedEffects, fe ≠ ∞ ∧ fe ≠ -∞
  betweenSubjectVariabilityNonnegative : ∀ bsv ∈ P.betweenSubjectVariability, bsv ≥ 0
  residualErrorNonnegative : P.residualError ≥ 0
  modelConvergedClosed : P.modelConverged
  validClosed : P.valid

def PopulationModelClosed (P : PopulationModel) : Prop :=
  (∀ re ∈ P.randomEffects, re ≠ ∞ ∧ re ≠ -∞) ∧
  (∀ fe ∈ P.fixedEffects, fe ≠ ∞ ∧ fe ≠ -∞) ∧
  (∀ bsv ∈ P.betweenSubjectVariability, bsv ≥ 0) ∧
  P.residualError ≥ 0 ∧ P.modelConverged ∧ P.valid

theorem population_model_closed_from_evidence (P : PopulationModel)
    (E : PopulationModelEvidence P) : PopulationModelClosed P := by
  exact And.intro E.randomEffectsFinite
    (And.intro E.fixedEffectsFinite
      (And.intro E.betweenSubjectVariabilityNonnegative
        (And.intro E.residualErrorNonnegative
          (And.intro E.modelConvergedClosed E.validClosed))))

end BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean
end HautevilleHouse