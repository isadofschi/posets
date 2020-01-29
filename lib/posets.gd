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
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3,4],[]);
#! <finite poset of size 4>
#! gap> Q:=PosetByCoveringRelations([1,2,3,4], [[1,3],[1,4],[2,3],[2,4]]);
#! <finite poset of size 4>
#! gap> P = Q;
#! false
#! gap> P = P;
#! true
#! @EndExampleSession
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

#! @Section Construction of posets


#! @Arguments X,f
#! @Description <C>PosetByFunction</C> creates a poset with set of points <A>X</A> and ordering function <A>f</A>. Checks that <A>f</A> defines a reflexive, antisymmetric and transitive relation on <A>X</A>.
#! @BeginExampleSession
#! gap> G:=AlternatingGroup(5);
#! Alt( [ 1 .. 5 ] )
#! gap> S:=AllSubgroups(G);;
#! gap> P:=PosetByFunction(S, IsSubgroup);
#! <finite poset of size 59>
#! gap> Q:=PosetOfSubgroups(G);
#! <finite poset of size 59>
#! gap> P = Q;
#! true
#! @EndExampleSession
DeclareOperation("PosetByFunction",[IsList,IsFunction]);

#! @Arguments X,f
#! @Description <C>PosetByFunctionNC</C> creates a poset with set of points <A>X</A> and ordering function <A>f</A> without any checks. 
#! @BeginExampleSession
#! gap> G:=AlternatingGroup(5);
#! Alt( [ 1 .. 5 ] )
#! gap> S:=AllSubgroups(G);;
#! gap> start:=Runtime();; P:=PosetByFunction(S,IsSubgroup);; Runtime()-start;
#! 624
#! gap> start:=Runtime();; Q:=PosetByFunctionNC(S,IsSubgroup);; Runtime()-start;
#! 0
#! gap> P = Q;
#! true
#! @EndExampleSession
DeclareOperation("PosetByFunctionNC",[IsList,IsFunction]);


#! @Arguments M
#! @Description Returns the poset $X$ on $\{1,\ldots,n\}$ such that $i\succcurlyeq j$ is given by $M_{i,j}$.
#! @BeginExampleSession
#! gap> S1:=MinimalFiniteModelSphere(1);
#! <finite poset of size 4>
#! gap> M:=OrderMatrix(S1);
#! [ [ true, false, false, false ], [ false, true, false, false ], [ true, true, true, false ],
#!   [ true, true, false, true ] ]
#! gap> Q:=PosetByOrderMatrix(M);
#! <finite poset of size 4>
#! gap> Set(Q);
#! [ 1 .. 4 ]
#! gap> IsomorphismPosets(S1,Q);
#! <order preserving map>
#! @EndExampleSession
DeclareOperation("PosetByOrderMatrix",[IsList]); # names are numbers 1..n
#! @Arguments X,M
#! @Description Returns the poset on <A>X</A> such that <C>X[i]>X[j]</C> is given by <C>M[i][j]</C>.
#! @BeginExampleSession
#! gap> S1:=MinimalFiniteModelSphere(1);
#! <finite poset of size 4>
#! gap> M:=OrderMatrix(S1);
#! [ [ true, false, false, false ], [ false, true, false, false ], [ true, true, true, false ],
#!   [ true, true, false, true ] ]
#! gap> Set(S1);
#! [ [ 1, "x" ], [ 1, "y" ], [ 2, "x" ], [ 2, "y" ] ]
#! gap> P:=PosetByOrderMatrix(["a","b","c","d"],M);
#! <finite poset of size 4>
#! gap> Set(P);
#! [ "a", "b", "c", "d" ]
#! gap> IsomorphismPosets(P,Q);
#! <order preserving map>
#! @EndExampleSession
DeclareOperation("PosetByOrderMatrix",[IsList,IsList]);
#! @Arguments M
#! @Description Returns the poset $X$ on $\{1,\ldots,n\}$ such that $i\succcurlyeq j$ is given by $M_{i,j}$ without any checks. 
DeclareOperation("PosetByOrderMatrixNC",[IsList]); # names are numbers 1..n
#! @Arguments X,M
#! @Description Returns the poset on <A>X</A> such that <C>X[i]>X[j]</C> is given by <C>M[i][j]</C> without any checks.
DeclareOperation("PosetByOrderMatrixNC",[IsList,IsList]);


#! @Arguments R
#! @Description Creates a <C>Poset</C> poset from a partial order binary relation, see <Ref Oper="IsPartialOrderBinaryRelation" BookName="ref"/>.
#! @BeginExampleSession
#! gap> R2:=BinaryRelationOnPoints([[1,2,3], [2,3], [3]]);
#! Binary Relation on 3 points
#! gap> IsPartialOrderBinaryRelation(R2);
#! true
#! gap> P:=PosetByOrderRelation(R2);
#! <finite poset of size 3>
#! @EndExampleSession
DeclareOperation("PosetByOrderRelation",[IsPartialOrderBinaryRelation]);

#! @Arguments X
#! @Description Not implemented.
DeclareOperation("PosetByHasseDiagram",[IsHasseDiagram]); # to do

#! @Arguments X, rel
#! @Description Creates the poset on <A>X</A> with covering relations given by <A>rel</A>. Each element of <A>rel</A> must be a pair <C>[x,y]</C> representing a covering relation $x\succ y$.
#! @BeginExampleSession
#! gap> rel:=[[1,3], [1,4], [2,3], [2,4]];
#! [ [ 1, 3 ], [ 1, 4 ], [ 2, 3 ], [ 2, 4 ] ]
#! gap> Q:=PosetByCoveringRelations([1,2,3,4],rel);
#! <finite poset of size 4>
#! gap> S1:=MinimalFiniteModelSphere(1);
#! <finite poset of size 4>
#! gap> IsomorphismPosets(S1,Q);
#! <order preserving map>
#! @EndExampleSession
DeclareOperation("PosetByCoveringRelations",[IsList, IsList]);

#############################################################################

#! @Section Representations of the ordering

#! @Arguments X
#! @Description Turns a poset <A>X</A> into a <C>Relation</C> on <C>[1..n]</C>, see <Ref Oper="Relations" BookName="ref"/>.
#! @BeginExampleSession
#! gap> W:=TheWallet();
#! <finite poset of size 11>
#! gap> RelationByPoset(W);
#! <general mapping: <object> -> <object> >
#! gap> IsPartialOrderBinaryRelation(last);
#! true
#! @EndExampleSession
DeclareOperation("RelationByPoset",[IsPoset]);

#! @Arguments X
#! @Description The order matrix of <A>X</A>. After calling <C>OrderMatrix</C> comparing two elements of <C>X</C> becomes immediate.
#! @BeginExampleSession
#! gap> S1:=MinimalFiniteModelSphere(1);
#! <finite poset of size 4>
#! gap> OrderMatrix(S1);
#! [ [ true, false, false, false ], [ false, true, false, false ], [ true, true, true, false ],
#!   [ true, true, false, true ] ]
#! @EndExampleSession
DeclareAttribute("OrderMatrix",IsPoset);

#! @Arguments X
#! @Description Returns a two valued function on the set <C>[1..Size(X)]</C>. If <A>X</A> has order matrix, this function valued in $(i,j)$ returns <C>OrderMatrix(X)[i][j]</C>. Otherwise, it returns <C>Ordering(X)(Set(X)[i],Set(X)[j])</C>.
#! @BeginExampleSession
#! gap> S1:=MinimalFiniteModelSphere(1);
#! <finite poset of size 4>
#! gap> OrderMatrix(S1);
#! [ [ true, false, false, false ], [ false, true, false, false ], [ true, true, true, false ],
#!   [ true, true, false, true ] ]
#! gap> fun:=OrderingByIndex(S1);
#! function( i, j ) ... end
#! gap> fun(1,3);
#! false
#! gap> fun(3,1);
#! true
#! gap> fun(2,2);
#! true
#! @EndExampleSession
DeclareAttribute("OrderingByIndex",IsPoset);

#! @Arguments X
#! @Description The list of covering relations of <A>X</A>.
#! @BeginExampleSession
#! gap> W:=TheWallet();
#! <finite poset of size 11>
#! gap> Set(W);
#! [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 ]
#! gap> CoveringRelations(W);
#! [ [ 1, 5 ], [ 1, 6 ], [ 2, 5 ], [ 2, 7 ], [ 3, 6 ], [ 3, 8 ], [ 4, 7 ], [ 4, 8 ], [ 5, 9 ], [ 5, 10 ], [ 6, 9 ],
#!   [ 6, 10 ], [ 7, 10 ], [ 7, 11 ], [ 8, 10 ], [ 8, 11 ] ]
#! @EndExampleSession
DeclareAttribute("CoveringRelations",IsPoset);

#! @Arguments X 
#! @Description Returns the function on <A>X</A> such that its value on an element <A>x</A> in <A>X</A> is the list of the upper covers of <A>x</A>. Recall that given a finite poset $X$ and an element $x\in X$, its upper covers are the elements $y\in X$ such that $y > x$ and there is no $z\in X$ such that $y > z > x$.
#! @BeginExampleSession
#! gap> W:=TheWallet();
#! <finite poset of size 11>
#! gap> Set(W);
#! [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 ]
#! gap> CoveringRelations(W);
#! [ [ 1, 5 ], [ 1, 6 ], [ 2, 5 ], [ 2, 7 ], [ 3, 6 ], [ 3, 8 ], [ 4, 7 ], [ 4, 8 ], [ 5, 9 ], [ 5, 10 ], [ 6, 9 ],
#!   [ 6, 10 ], [ 7, 10 ], [ 7, 11 ], [ 8, 10 ], [ 8, 11 ] ]
#! gap> fun:=UpperCovers(W);
#! function( x ) ... end
#! gap> fun(1);
#! [  ]
#! gap> fun(10);
#! [ 5, 6, 7, 8 ]
#! gap> fun(5);
#! [ 1, 2 ]
#! @EndExampleSession
DeclareAttribute("UpperCovers",IsPoset);

#! @Arguments X,x
#! @Description Returns the upper covers of the element <A>x</A> in the poset <A>X</A>.
#! @BeginExampleSession
#! gap> W:=TheWallet();
#! <finite poset of size 11>
#! gap> Set(W);
#! [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 ]
#! gap> UpperCovers(W,10);
#! [ 5, 6, 7, 8 ]
#! @EndExampleSession
DeclareOperation("UpperCovers",[IsPoset,IsObject]);

#! @Arguments X
#! @Description Returns the function on <A>X</A> such that its value on an element <A>x</A> in <A>X</A> is the list of the lower covers of <A>x</A>. Recall that given a finite poset $X$ and an element $x\in X$, its lower covers are the elements $y\in X$ such that $x > y$ and there is no $z\in X$ such that $x > z > y$.
#! @BeginExampleSession
#! gap> S1:=PosetByCoveringRelations([1,2,3,4], [[3,1],[3,2],[4,1],[4,2]]);
#! <finite poset of size 4>
#! gap> CoveringRelations(S1);
#! [ [ 3, 1 ], [ 3, 2 ], [ 4, 1 ], [ 4, 2 ] ]
#! gap> g:=LowerCovers(S1);
#! function( x ) ... end
#! gap> g(2);
#! [  ]
#! gap> g(4);
#! [ 1, 2 ]
#! @EndExampleSession
DeclareAttribute("LowerCovers",IsPoset);

#! @Arguments X,x
#! @Description Returns the lower covers of the element <A>x</A> in the poset <A>X</A>.
#! @BeginExampleSession
#! gap> S1:=PosetByCoveringRelations([1,2,3,4], [[3,1],[3,2],[4,1],[4,2]]);
#! <finite poset of size 4>
#! gap> LowerCovers(S1,4);
#! [ 1, 2 ]
#! @EndExampleSession
DeclareOperation("LowerCovers",[IsPoset,IsObject]);

#! @Arguments X
#! @Description The set of maximal points of $X$.
#! @BeginExampleSession
#! gap> G:=AlternatingGroup(5);
#! Alt( [ 1 .. 5 ] )
#! gap> SpG:=BrownPoset(G,2);
#! <finite poset of size 20>
#! gap> Max:=MaximalElements(SpG);;
#! gap> Size(Max);
#! 5
#! gap> List(Max,Order);
#! [ 4, 4, 4, 4, 4 ]
#! gap> S:=SylowSubgroup(G,2);;
#! gap> N:=Normalizer(G,S);;
#! gap> Index(G,N);
#! 5
#! gap> Min:=MinimalElements(SpG);;
#! gap> Size(Min);
#! 15
#! gap> List(Min,Order);
#! [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ]
#! @EndExampleSession
DeclareAttribute("MaximalElements",IsPoset);

#! @Arguments X
#! @Description The set of minimal points of $X$.
#! @BeginExampleSession
#! gap> G:=AlternatingGroup(5);
#! Alt( [ 1 .. 5 ] )
#! gap> SpG:=BrownPoset(G,2);
#! <finite poset of size 20>
#! gap> Min:=MinimalElements(SpG);;
#! gap> Size(Min);
#! 15
#! gap> List(Min,Order);
#! [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ]
#! @EndExampleSession
DeclareAttribute("MinimalElements",IsPoset);

#! @Arguments X
#! @Description Returns the maximum of the poset if it exists. Otherwise it returns fail.
#! @BeginExampleSession
#! gap> P:=CyclicGroup(4);
#! <pc group of size 4 with 2 generators>
#! gap> SpG:=BrownPoset(P,2);
#! <finite poset of size 2>
#! gap> MaximumPoset(SpG);
#! Group([ f2, f1 ])
#! gap> W:=TheWallet();
#! <finite poset of size 11>
#! gap> MaximumPoset(W);
#! fail
#! @EndExampleSession
DeclareAttribute("MaximumPoset",IsPoset);

#! @Arguments X
#! @Description Returns the minimum of the poset if it exists. Otherwise it returns fail.
#! @BeginExampleSession
#! gap> P:=SmallGroup(4,2);
#! <pc group of size 4 with 2 generators>
#! gap> SpG:=BrownPoset(P,2);
#! <finite poset of size 2>
#! gap> MinimumPoset(SpG);
#! fail
#! gap> W:=TheWallet();
#! <finite poset of size 11>
#! gap> MinimumPoset(W);
#! fail
#! @EndExampleSession
DeclareAttribute("MinimumPoset",IsPoset);



