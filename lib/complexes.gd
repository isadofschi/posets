#! @Chapter Topology

#! @Section Face poset and order complex

#######################################################

#! @Arguments K
DeclareOperation("FacePoset",[IsHapSimplicialComplex]);

#! @Arguments X
DeclareOperation("OrderComplex",[IsPoset]);

#! @Arguments f
DeclareOperation("FacePoset",[IsHapSimplicialMap]);

#! @Arguments f
DeclareOperation("OrderComplex",[IsPosetHomomorphism]);

#######################################################

#! @Arguments X
DeclareOperation("BarycentricSubdivision",[IsPoset]);

#! @Arguments K
DeclareOperation("BarycentricSubdivision",[IsHapSimplicialComplex]);

#! @Arguments f
DeclareOperation("BarycentricSubdivision",[IsHapSimplicialMap]);

#! @Arguments f
DeclareOperation("BarycentricSubdivision",[IsPosetHomomorphism]);

#######################################################

#! @Section Homology

#! @Arguments X
#! @Description The homology $H_*(X)$.
DeclareOperation("PosetHomology",[IsPoset]);

#! @Arguments X,n
DeclareOperation("PosetHomology",[IsPoset,IsInt]);

#! @Arguments f,n
#! @Description  $H_n(f)$.
DeclareOperation("PosetHomology",[IsPosetHomomorphism,IsInt]);

#######################################################

#! @Section More invariants

#! @Arguments X
DeclareAttribute("EulerCharacteristic",IsPoset);

#! @Arguments X
DeclareOperation("FundamentalGroup",[IsPoset]);


