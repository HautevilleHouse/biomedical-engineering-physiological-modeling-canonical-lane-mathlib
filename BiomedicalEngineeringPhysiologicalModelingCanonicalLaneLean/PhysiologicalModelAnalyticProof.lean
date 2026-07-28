import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.PhysiologicalModelingCanonicalLaneLean.CompartmentModelPackage
import HautevilleHouse.PhysiologicalModelingCanonicalLaneLean.PharmacokineticModelEvidenceTerms
import HautevilleHouse.PhysiologicalModelingCanonicalLaneLean.DiagnosticInferencePackage
import HautevilleHouse.PhysiologicalModelingCanonicalLaneLean.SurvivalAnalysisPackage

namespace HautevilleHouse
namespace PhysiologicalModelingCanonicalLaneLean

structure PhysiologicalModelAnalyticFoundation where
  compartment : CompartmentModelPackage
  compartmentEvidence : CompartmentModelEvidence compartment
  pharmacokinetic : PharmacokineticEvidenceTerms
  diagnostic : DiagnosticInferencePackage
  diagnosticEvidence : DiagnosticInferenceEvidence diagnostic
  survival : SurvivalAnalysisPackage
  survivalEvidence : SurvivalAnalysisEvidence survival

def PhysiologicalModelAnalyticFoundationClosed (A : PhysiologicalModelAnalyticFoundation) : Prop :=
  CompartmentModelClosed A.compartment ∧
  PharmacokineticAnalyticCertificate A.pharmacokinetic ∧
  DiagnosticInferenceClosed A.diagnostic ∧
  SurvivalAnalysisClosed A.survival

theorem physiological_model_foundation_closed (A : PhysiologicalModelAnalyticFoundation) :
  PhysiologicalModelAnalyticFoundationClosed A := by
  exact And.intro (compartment_model_closed_from_evidence A.compartment A.compartmentEvidence)
    (And.intro (pharmacokinetic_certificate_closed A.pharmacokinetic)
      (And.intro (diagnostic_inference_closed_from_evidence A.diagnostic A.diagnosticEvidence)
        (survival_analysis_closed_from_evidence A.survival A.survivalEvidence)))

end PhysiologicalModelingCanonicalLaneLean
end HautevilleHouse