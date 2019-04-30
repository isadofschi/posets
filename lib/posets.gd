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


DeclareCategory("IsPoset",IsObject);
DeclareCategory("IsPosetHomomorphism",IsObject);

#############################################################################

#! @Arguments X
#! @Returns a function computing the order of the poset <M>X</M>.
#! @Description Ordering(X)(x,y) is the value of the expression <M>x\geq y</M>.
DeclareOperation("Ordering",[IsPoset]); # returns the ordering function

DeclareOperation("Set",[IsPoset]); # returns the set of points
DeclareAttribute("Size",IsPoset); # returns the set of points

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

#!
DeclareOperation("PosetByOrderRelation",[IsPartialOrderBinaryRelation]);
#!
DeclareOperation("PosetByHasseDiagram",[IsHasseDiagram]); # to do
#!
DeclareOperation("PosetByCoveringRelations",[IsList, IsList]); # to do


#############################################################################

#! @Section Constructing poset homomorphisms

#!
DeclareOperation("PosetHomomorphismByFunctionNC",[IsPoset,IsPoset,IsFunction]);
#!
DeclareOperation("PosetHomomorphismByFunction",[IsPoset,IsPoset,IsFunction]);
#!
DeclareOperation("PosetHomomorphismByImages",[IsPoset,IsPoset,IsList]);
#!
DeclareOperation("PosetHomomorphismByMapping",[IsPoset,IsPoset,IsMapping]);
#!
DeclareOperation("IsomorphismPosets",[IsPoset,IsPoset]);
#! (f.g)(x) = f(g(x))
DeclareOperation("CompositionPosetHomomorphisms",[IsPosetHomomorphism,IsPosetHomomorphism]);

#!
DeclareOperation("\*",[IsPosetHomomorphism,IsPosetHomomorphism]);
DeclareOperation("\*",[IsList,IsPosetHomomorphism]);
DeclareOperation("\*",[IsPosetHomomorphism,IsList]);
DeclareOperation("\^",[IsPosetHomomorphism,IsInt]);

#############################################################################

#! @Section Other useful representations of the ordering

#!
DeclareOperation("RelationByPoset",[IsPoset]);
#!
DeclareAttribute("OrderMatrix",IsPoset);
#!
DeclareAttribute("CoveringRelations",IsPoset);
#!
DeclareAttribute("UpperCovers",IsPoset);
#!
DeclareOperation("UpperCovers",[IsPoset,IsObject]);
#!
DeclareAttribute("LowerCovers",IsPoset);
#!
DeclareOperation("LowerCovers",[IsPoset,IsObject]);
#!
DeclareAttribute("MaximalElements",IsPoset);
#!
DeclareAttribute("MinimalElements",IsPoset);
