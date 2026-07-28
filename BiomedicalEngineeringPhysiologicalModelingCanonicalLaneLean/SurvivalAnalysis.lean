import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean

structure SurvivalAnalysisPackage where
  hazardFunction : Type u
  survivalFunction : Type v
  kaplanMeierEstimator : Prop
  coxProportionalHazards : Prop
  logRankTest : Prop

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  kaplanMeierEstimatorClosed : S.kaplanMeierEstimator
  coxProportionalHazardsClosed : S.coxProportionalHazards
  logRankTestClosed : S.logRankTest

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  S.kaplanMeierEstimator ∧ S.coxProportionalHazards ∧ S.logRankTest

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage)
    (E : SurvivalAnalysisEvidence S) : SurvivalAnalysisClosed S :=
  And.intro E.kaplanMeierEstimatorClosed
    (And.intro E.coxProportionalHazardsClosed E.logRankTestClosed)

end BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean
end HautevilleHouse