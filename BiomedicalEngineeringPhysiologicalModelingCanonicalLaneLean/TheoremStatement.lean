import HautevilleHouse.BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  manifoldConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String
deriving Repr, DecidableEq

def sourceTheoremStatement : TheoremStatement :=
  { sourceKey := "biomedical-engineering-physiological-modeling-canonical-lane",
    theoremName := "Physiological Modeling Closure",
    theoremObject := "Biomedical Engineering Physiological Modeling Theorem",
    classicalBoundary := "Classical boundary carried",
    manifoldConstrainedStatement := "Compartment model and pharmacokinetic inference closure",
    certificateLane := "manifold_constrained",
    carriedRemainder := "Remainder carried"
  }

end BiomedicalEngineeringPhysiologicalModelingCanonicalLaneLean
end HautevilleHouse
