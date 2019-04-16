#! @Chapter Topology

#! @Section Face poset and order complex

#!
DeclareOperation("FacePoset",[IsHapSimplicialComplex]);
#!
DeclareOperation("OrderComplex",[IsPoset]);

#!
DeclareOperation("BarycentricSubdivision",[IsPoset]);
#!
DeclareOperation("BarycentricSubdivision",[IsHapSimplicialComplex]);


#! @Section Some homotopy properties

#!
DeclareOperation("PosetHomology",[IsPoset]);
#!
DeclareAttribute("EulerCharacteristic",IsPoset);
#!
DeclareOperation("FundamentalGroup",[IsPoset]);


