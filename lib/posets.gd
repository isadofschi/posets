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


DeclareOperation("Ordering",[IsPoset]); # returns the ordering function



DeclareOperation("PosetByFunctionNC",[IsList,IsFunction]); # no checks
DeclareOperation("PosetByOrderMatrix",[IsList]); # names are numbers 1..n
DeclareOperation("PosetByOrderMatrix",[IsList,IsList]); # we give a set of names

DeclareOperation("PosetHomomorphismByImages",[IsPoset,IsPoset,IsList]);
DeclareOperation("RelationByPoset",[IsPoset]);
DeclareOperation("PosetByOrderRelation",[IsPartialOrderBinaryRelation]);
DeclareOperation("PosetByHasseDiagram",[IsHasseDiagram]); # to do


DeclareOperation("OrderMatrix",[IsPoset]); # (computes and) returns the order matrix
DeclareOperation("HasseDiagram",[IsPoset]);



