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

DeclareOperation("PosetByOrderMatrix",[IsList]); # names are numbers 1..n
DeclareOperation("PosetByOrderMatrix",[IsList,IsList]); # we give a set of names

DeclareOperation("PosetHomomorphismByImages",[IsPoset,IsPoset,IsList]);
DeclareOperation("RelationByPoset",[IsPoset]);
DeclareOperation("PosetByOrderRelation",[IsPartialOrderBinaryRelation]);
DeclareOperation("PosetByHasseDiagram",[IsHasseDiagram]); # to do
DeclareOperation("HasseDiagram",[IsPoset]);


DeclareOperation("FacePoset",[SCIsSimplicialComplex]);
DeclareOperation("OrderComplex",[IsPoset]);


DeclareOperation("PosetHomology",[IsPoset]);
DeclareOperation("EulerCharacteristic",[IsPoset]);
DeclareOperation("FundamentalGroup",[IsPoset]);
