#############################################################################
##
#W  posets.gd             Posets Package
##
##
##  
##  
##

#! @Chapter Posets

#! @Section The Poset type


DeclareCategory("IsPoset",IsSet);
DeclareCategory("IsPosetHomomorphism",IsSet);

#############################################################################

#! @Arguments X
#! @Returns a function computing the order of the poset <M>X</M>.
#! @Description Ordering(X)(x,y) is the value of the expression <M>x\geq y</M>.
DeclareOperation("Ordering",[IsPoset]); # returns the ordering function

#############################################################################

#! @Section Constructing posets in different ways

#!
DeclareOperation("PosetByFunctionNC",[IsList,IsFunction]); # no checks
#!
DeclareOperation("PosetByFunction",[IsList,IsFunction]);
#!
DeclareOperation("PosetByOrderMatrix",[IsList]); # names are numbers 1..n
#!
DeclareOperation("PosetByOrderMatrix",[IsList,IsList]); # we give a set of names

#############################################################################

#!
DeclareOperation("PosetHomomorphismByFunctionNC",[IsPoset,IsPoset,IsFunction]);
#!
DeclareOperation("PosetHomomorphismByFunction",[IsPoset,IsPoset,IsFunction]);
#!
DeclareOperation("PosetHomomorphismByImages",[IsPoset,IsPoset,IsList]);
#!
DeclareOperation("PosetHomomorphismByMapping",[IsPoset,IsPoset,IsMapping]);
#############################################################################

#!
DeclareOperation("RelationByPoset",[IsPoset]);
#!
DeclareOperation("PosetByOrderRelation",[IsPartialOrderBinaryRelation]);
#!
DeclareOperation("PosetByHasseDiagram",[IsHasseDiagram]); # to do

#############################################################################

#! @Section Classical constructions

#!
DeclareOperation("OrderMatrix",[IsPoset]); # (computes and) returns the order matrix
#!
DeclareOperation("HasseDiagram",[IsPoset]);
#!
DeclareOperation("CoveringRelations",[IsPoset]);
#!
DeclareOperation("UpperCovers",[IsPoset,IsObject]);
#!
DeclareOperation("LowerCovers",[IsPoset,IsObject]);


