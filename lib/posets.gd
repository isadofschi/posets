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
#! @Description A function computing the order of the poset <M>X</M>. The truth value of the expression <M>x\geq y</M> is <C>Ordering(X)(x,y)</C>.
#! @BeginExampleSession
#! gap> W:=TheWallet();
#! <finite poset of size 11>
#! gap> o:=Ordering(W);
#! function( x, y ) ... end
#! gap> o(1,5);
#! true
#! gap> o(1,7);
#! false
#! @EndExampleSession
DeclareOperation("Ordering",[IsPoset]);

#! @Arguments X
#! @Description The set of points of $X$.
#! @BeginExampleSession
#! gap> Set(TheWallet());
#! [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 ]
#! @EndExampleSession
DeclareOperation("Set",[IsPoset]);


#! @Arguments X_1,X_2
#! @Description Two posets are equal if the sets of points are equal and the ordering is the same.
DeclareOperation("\=",[IsPoset]);

#! @Arguments X
#! @Description The size (number of points) of $X$.
#! @BeginExampleSession
#! gap> S4:=MinimalFiniteModelSphere(4);;
#! gap> Size(S4);
#! 10
#! @EndExampleSession
DeclareAttribute("Size",IsPoset);


#! @Arguments X
#! @Description An iterator for the set of points of $X$.
DeclareOperation("Iterator",[IsPoset]);

#! @Arguments x,X
#! @Description The truth value of $x\in X$.
#! @BeginExampleSession
#! gap> 11 in TheWallet();
#! true
#! gap> 12 in TheWallet();
#! false
#! gap> S2:=MinimalFiniteModelSphere(2);;
#! gap> IdentityMap(S2) in HomPosets(S2,S2);
#! true
#! @EndExampleSession
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
