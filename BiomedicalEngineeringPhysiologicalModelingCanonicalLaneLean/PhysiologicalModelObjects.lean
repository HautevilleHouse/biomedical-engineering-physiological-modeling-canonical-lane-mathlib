import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace PhysiologicalModelingCanonicalLaneLean

structure PhysiologicalSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure PhysiologicalAdmittedObject where
  space : PhysiologicalSpace
  physiologicalSystem : Prop
  parametersIdentified : Prop
  compartmentModel : Type
  modelTopology : TopologicalSpace compartmentModel
  modelValidated : Prop
  conclusion : modelValidated

structure PhysiologicalEndgameState where
  object : PhysiologicalAdmittedObject

def PhysiologicalWitnessClosed (O : PhysiologicalAdmittedObject) : Prop :=
  O.modelValidated

end PhysiologicalModelingCanonicalLaneLean
end HautevilleHouse