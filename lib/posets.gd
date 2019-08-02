#############################################################################
##
#W  posets.gd             Posets Package
##
##
##  
##  
##
#! @Chapter Introduction

#! Our main reference is <Cite Key="BarmakBook"/>.

#! @Chapter Posets

#! @Section The Poset type

#! Every poset has a Set of points and an Ordering.
DeclareCategory("IsPoset",IsObject);
DeclareCategory("IsPosetHomomorphism",IsObject);

#############################################################################

#! @Arguments X
#! @Returns a function computing the order of the poset <M>X</M>.
#! @Description Ordering(X)(x,y) is the truth value of the expression <M>x\geq y</M>.
DeclareOperation("Ordering",[IsPoset]);

#! @Arguments X
#! @Description The set of points of $X$.
DeclareOperation("Set",[IsPoset]);

#! @Arguments X
#! @Description The size (number of points) of $X$.
DeclareAttribute("Size",IsPoset);

#! @Arguments X
#! @Description An iterator for the set of points of $X$.
DeclareOperation("Iterator",[IsPoset]);

#! @Arguments x,X
#! @Description The truth value of $x\in X$.
DeclareOperation("\in",[IsObject,IsPoset]);
#############################################################################

#! @Section Constructing posets in different ways

#! @Arguments X,f
DeclareOperation("PosetByFunctionNC",[IsList,IsFunction]); # no checks

#! @Arguments X,f
DeclareOperation("PosetByFunction",[IsList,IsFunction]);

#! @Arguments M
#! @Description Returns the poset $X$ on $\{1,\ldots,n\}$ such that $i\geqslant j$ is given by $M_{i,j}$.
DeclareOperation("PosetByOrderMatrix",[IsList]); # names are numbers 1..n

#! @Arguments X,M
DeclareOperation("PosetByOrderMatrix",[IsList,IsList]); # we give a set of names

#! @Arguments R
DeclareOperation("PosetByOrderRelation",[IsPartialOrderBinaryRelation]);

#! @Arguments X
DeclareOperation("PosetByHasseDiagram",[IsHasseDiagram]); # to do

#! @Arguments l
DeclareOperation("PosetByCoveringRelations",[IsList, IsList]); # to do


#############################################################################

#! @Section Constructing poset homomorphisms in different ways

#! @Arguments X,Y,f
DeclareOperation("PosetHomomorphismByFunctionNC",[IsPoset,IsPoset,IsFunction]);

#! @Arguments X,Y,f
DeclareOperation("PosetHomomorphismByFunction",[IsPoset,IsPoset,IsFunction]);

#! @Arguments X,Y,ys
DeclareOperation("PosetHomomorphismByImages",[IsPoset,IsPoset,IsList]);

#! @Arguments X,Y,f
DeclareOperation("PosetHomomorphismByMapping",[IsPoset,IsPoset,IsMapping]);

#! @Arguments X,Y
#! @Description returns an isomorphism between $X$ and $Y$ or fail if the posets are not isomorphic.
DeclareOperation("IsomorphismPosets",[IsPoset,IsPoset]);

#! @Arguments f,g
#! @Description returns the composition $f\circ g$.
DeclareOperation("CompositionPosetHomomorphisms",[IsPosetHomomorphism,IsPosetHomomorphism]);

#! @Arguments f,g
#! @Description returns the composition $f\circ g$.
DeclareOperation("\*",[IsPosetHomomorphism,IsPosetHomomorphism]);

#!
DeclareOperation("\*",[IsList,IsPosetHomomorphism]);

#!
DeclareOperation("\*",[IsPosetHomomorphism,IsList]);

#! @Arguments f,n
#! @Description Returns $f^n$. If $n=0$ returns the identity. It works for $n&lt;0$ if $f$ is bijective.
DeclareOperation("\^",[IsPosetHomomorphism,IsInt]);

#############################################################################

#! @Section Other useful representations of the ordering

#! @Arguments X
DeclareOperation("RelationByPoset",[IsPoset]);

#! @Arguments X
DeclareAttribute("OrderMatrix",IsPoset);

#! @Arguments X
DeclareAttribute("CoveringRelations",IsPoset);

#! @Arguments X
DeclareAttribute("UpperCovers",IsPoset);

#! @Arguments X,x
DeclareOperation("UpperCovers",[IsPoset,IsObject]);

#! @Arguments X
DeclareAttribute("LowerCovers",IsPoset);

#! @Arguments X,x
DeclareOperation("LowerCovers",[IsPoset,IsObject]);

#! @Arguments X
#! @Description The set of maximal points of $X$.
DeclareAttribute("MaximalElements",IsPoset);

#! @Arguments X
#! @Description The set of minimal points of $X$.
DeclareAttribute("MinimalElements",IsPoset);
