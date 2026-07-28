import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.PhysiologicalModelingCanonicalLaneLean.PhysiologicalModelObjects

namespace HautevilleHouse
namespace PhysiologicalModelingCanonicalLaneLean

structure SurvivalAnalysisPackage {P : PhysiologicalAdmittedObject} where
  hazardFunction : Prop
  survivalFunction : Prop
  censoringMechanism : Prop
  kaplanMeierEstimate : Prop

structure SurvivalAnalysisEvidence {P : PhysiologicalAdmittedObject} (S : SurvivalAnalysisPackage P) where
  hazardFunctionClosed : S.hazardFunction
  survivalFunctionClosed : S.survivalFunction
  censoringMechanismClosed : S.censoringMechanism
  kaplanMeierEstimateClosed : S.kaplanMeierEstimate

def SurvivalAnalysisClosed {P : PhysiologicalAdmittedObject} (S : SurvivalAnalysisPackage P) : Prop :=
  S.hazardFunction ∧ S.survivalFunction ∧ S.censoringMechanism ∧ S.kaplanMeierEstimate

theorem survival_analysis_closed_from_evidence {P : PhysiologicalAdmittedObject} (S : SurvivalAnalysisPackage P) (E : SurvivalAnalysisEvidence S) :
  SurvivalAnalysisClosed S := by
  exact And.intro E.hazardFunctionClosed (And.intro E.survivalFunctionClosed (And.intro E.censoringMechanismClosed E.kaplanMeierEstimateClosed))

end PhysiologicalModelingCanonicalLaneLean
end HautevilleHouse