#############################################################################
##
#W  posets.gd             Posets Package
##
##
##  
##  
##
#! @Chapter Introduction

#! This &GAP; package is meant to be a toolbox to study finite posets (equivalently, $T_0$ finite topological spaces) from a topological viewpoint. Our main reference is <Cite Key="BarmakBook"/>.


#############################################################################
#############################################################################


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
#! @Description <C>PosetByFunction</C> creates a poset with set of points <A>X</A> and ordering function <A>f</A>. Checks that <A>f</A> defines a reflexive, antisymmetric and transitive relation on <A>X</A>.
DeclareOperation("PosetByFunction",[IsList,IsFunction]);

#! @Arguments X,f
#! @Description <C>PosetByFunctionNC</C> creates a poset with set of points <A>X</A> and ordering function <A>f</A> without any checks. 
DeclareOperation("PosetByFunctionNC",[IsList,IsFunction]);



#! @Arguments M
#! @Description Returns the poset $X$ on $\{1,\ldots,n\}$ such that $i\succcurlyeq j$ is given by $M_{i,j}$.
DeclareOperation("PosetByOrderMatrix",[IsList]); # names are numbers 1..n

#! @Arguments X,M
#! @Description Returns the poset on <A>X</A> such that <C>X[i]>X[j]</C> is given by <C>M[i][j]</C>.
DeclareOperation("PosetByOrderMatrix",[IsList,IsList]);

#! @Arguments R
#! @Description Creates a <C>Poset</C> poset from a partial order binary relation, see <Ref Oper="IsPartialOrderBinaryRelation" BookName="ref"/>.
DeclareOperation("PosetByOrderRelation",[IsPartialOrderBinaryRelation]);

#! @Arguments X
#! @Description Not implemented.
DeclareOperation("PosetByHasseDiagram",[IsHasseDiagram]); # to do

#! @Arguments X, rel
#! @Description Creates the poset on <A>X</A> with covering relations given by <A>rel</A>. Each element of <A>rel</A> must be a pair <C>[x,y]</C> representing a covering relation $x\succ y$.
DeclareOperation("PosetByCoveringRelations",[IsList, IsList]);

#############################################################################

#! @Section Other useful representations of the ordering

#! @Arguments X
#! @Description Turns a poset <A>X</A> into a <C>Relation</C> on <C>[1..n]</C>, see <Ref Oper="Relations" BookName="ref"/>.
DeclareOperation("RelationByPoset",[IsPoset]);

#! @Arguments X
#! @Description The order matrix of <A>X</A>. After calling <C>OrderMatrix</C> comparing two elements of <C>X</C> becomes immediate.
DeclareAttribute("OrderMatrix",IsPoset);

#! @Arguments X
#! @Description The list of covering relations of <A>X</A>.
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

