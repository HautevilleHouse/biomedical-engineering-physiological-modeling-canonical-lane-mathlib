import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean

structure PharmacokineticParameters where
  clearance : Float
  volumeDistribution : Float
  halfLife : Float
  bioavailability : Float
  absorptionRate : Float
  eliminationRate : Float
  valid : Prop

structure PharmacokineticParametersEvidence (P : PharmacokineticParameters) where
  clearancePositive : P.clearance > 0
  volumePositive : P.volumeDistribution > 0
  halfLifePositive : P.halfLife > 0
  bioavailabilityBetweenZeroAndOne : 0 ≤ P.bioavailability ∧ P.bioavailability ≤ 1
  validClosed : P.valid

def PharmacokineticParametersClosed (P : PharmacokineticParameters) : Prop :=
  P.clearance > 0 ∧ P.volumeDistribution > 0 ∧ P.halfLife > 0 ∧
  (0 ≤ P.bioavailability ∧ P.bioavailability ≤ 1) ∧ P.valid

theorem pharmacokinetic_parameters_closed_from_evidence (P : PharmacokineticParameters)
    (E : PharmacokineticParametersEvidence P) : PharmacokineticParametersClosed P := by
  exact And.intro E.clearancePositive
    (And.intro E.volumePositive
      (And.intro E.halfLifePositive
        (And.intro E.bioavailabilityBetweenZeroAndOne E.validClosed)))

end BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean
end HautevilleHouse