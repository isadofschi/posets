#! @Chapter Topology

#! @Section Face poset and order complex

#######################################################

#!
DeclareOperation("FacePoset",[IsHapSimplicialComplex]);
#!
DeclareOperation("OrderComplex",[IsPoset]);

#!
DeclareOperation("FacePoset",[IsHapSimplicialMap]);
#!
DeclareOperation("OrderComplex",[IsPosetHomomorphism]);

#######################################################

#!
DeclareOperation("BarycentricSubdivision",[IsPoset]);
#!
DeclareOperation("BarycentricSubdivision",[IsHapSimplicialComplex]);

#!
DeclareOperation("BarycentricSubdivision",[IsHapSimplicialMap]);
#!
DeclareOperation("BarycentricSubdivision",[IsPosetHomomorphism]);

#######################################################

#! @Section Homology

#! @Arguments X
#! @Returns <M>H_*(X)</M>
DeclareOperation("PosetHomology",[IsPoset]);
DeclareOperation("PosetHomology",[IsPoset,IsInt]);
#! @Arguments f,n
#! @Returns <M>H_n(f)</M>
DeclareOperation("PosetHomology",[IsPosetHomomorphism,IsInt]);

#######################################################

#! @Section More invariants

#!
DeclareAttribute("EulerCharacteristic",IsPoset);
#!
DeclareOperation("FundamentalGroup",[IsPoset]);


