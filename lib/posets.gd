#############################################################################
##
#W  posets.gd             Posets Package
##
##
##  
##  
##


DeclareCategory("IsPoset",IsSet);
DeclareCategory("IsPosetHomomorphism",IsSet);

DeclareOperation("PosetFromOrderMatrix",[IsList]);
DeclareOperation("PosetHomomorphismByImages",[IsPoset,IsPoset,IsList]);


DeclareOperation("FacePoset",[SCIsSimplicialComplex]);
DeclareOperation("OrderComplex",[IsPoset]);


DeclareOperation("PosetHomology",[IsPoset]);

DeclareOperation("EulerCharacteristic",[IsPoset]);
