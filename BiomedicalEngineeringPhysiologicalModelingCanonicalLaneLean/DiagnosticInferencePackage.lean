import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.PhysiologicalModelingCanonicalLaneLean.PhysiologicalModelObjects

namespace HautevilleHouse
namespace PhysiologicalModelingCanonicalLaneLean

structure DiagnosticInferencePackage {P : PhysiologicalAdmittedObject} where
  priorDistribution : Prop
  likelihoodFunction : Prop
  posteriorComputed : Prop
  decisionRule : Prop

structure DiagnosticInferenceEvidence {P : PhysiologicalAdmittedObject} (D : DiagnosticInferencePackage P) where
  priorDistributionClosed : D.priorDistribution
  likelihoodFunctionClosed : D.likelihoodFunction
  posteriorComputedClosed : D.posteriorComputed
  decisionRuleClosed : D.decisionRule

def DiagnosticInferenceClosed {P : PhysiologicalAdmittedObject} (D : DiagnosticInferencePackage P) : Prop :=
  D.priorDistribution ∧ D.likelihoodFunction ∧ D.posteriorComputed ∧ D.decisionRule

theorem diagnostic_inference_closed_from_evidence {P : PhysiologicalAdmittedObject} (D : DiagnosticInferencePackage P) (E : DiagnosticInferenceEvidence D) :
  DiagnosticInferenceClosed D := by
  exact And.intro E.priorDistributionClosed (And.intro E.likelihoodFunctionClosed (And.intro E.posteriorComputedClosed E.decisionRuleClosed))

end PhysiologicalModelingCanonicalLaneLean
end HautevilleHouse