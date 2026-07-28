import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean

structure DrugDosingRegimen where
  dose : Float
  interval : Float
  numberOfDoses : Nat
  route : String
  steadyStateAchieved : Prop
  compliance : Prop

structure DrugDosingRegimenEvidence (D : DrugDosingRegimen) where
  dosePositive : D.dose > 0
  intervalPositive : D.interval > 0
  numberOfDosesPositive : D.numberOfDoses > 0
  routeDefined : D.route = "oral" ∨ D.route = "intravenous" ∨ D.route = "subcutaneous"
  steadyStateClosed : D.steadyStateAchieved
  complianceClosed : D.compliance

def DrugDosingRegimenClosed (D : DrugDosingRegimen) : Prop :=
  D.dose > 0 ∧ D.interval > 0 ∧ D.numberOfDoses > 0 ∧
  (D.route = "oral" ∨ D.route = "intravenous" ∨ D.route = "subcutaneous") ∧
  D.steadyStateAchieved ∧ D.compliance

theorem drug_dosing_regimen_closed_from_evidence (D : DrugDosingRegimen)
    (E : DrugDosingRegimenEvidence D) : DrugDosingRegimenClosed D := by
  exact And.intro E.dosePositive
    (And.intro E.intervalPositive
      (And.intro E.numberOfDosesPositive
        (And.intro E.routeDefined
          (And.intro E.steadyStateClosed E.complianceClosed))))

end BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean
end HautevilleHouse