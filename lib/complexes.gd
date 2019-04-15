#! @Chapter Topology

#! @Section Face poset and order complex

#!
DeclareOperation("FacePoset",[IsHapSimplicialComplex]);
#!
DeclareOperation("OrderComplex",[IsPoset]);

#! @Section Some homotopy properties

#!
DeclareOperation("PosetHomology",[IsPoset]);
#!
DeclareAttribute("EulerCharacteristic",IsPoset);
#!
DeclareOperation("FundamentalGroup",[IsPoset]);

