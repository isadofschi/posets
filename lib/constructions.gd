#! @Chapter Constructing new posets

#! @Section Categorical constructions
# DirectProduct. DirectProduct and Coproduct for maps.

#! @Arguments X, A
#! @Description The subposet of $X$ whose underlying set is the list $A$ of elements of $X$.
#! @BeginExampleSession
#! gap> A:=PosetByCoveringRelations([1,2,3,4], [[3,1],[3,2], [4,1],[4,2]]);
#! <finite poset of size 4>
#! gap> SubPoset(A,[1,2]);
#! <finite poset of size 2>
#! gap> CoveringRelations(last);
#! [  ]
#! @EndExampleSession
DeclareOperation("SubPoset",[IsPoset,IsList]);

#! @Arguments X, A
#! @Description Given a list of posets, returns the coproduct of these posets in the given order. It also computes the natural inclusion maps.
#! @BeginExampleSession
#! @EndExampleSession
DeclareOperation("CoproductOp",[IsList,IsPoset]);

#! @Arguments X_1,X_2,...
#! @Description The coproduct of posets. It also computes the natural inclusion maps.
#! @BeginExampleSession
#! gap> A:=PosetByCoveringRelations([1,2,3,4], [[3,1],[3,2], [4,1],[4,2]]);
#! <finite poset of size 4>
#! gap> B:=PosetByCoveringRelations([1,2],[]);
#! <finite poset of size 2>
#! gap> C:=TheWallet();
#! <finite poset of size 11>
#! gap> Coproduct(A,B,C);
#! <finite poset of size 17>
#! @EndExampleSession
DeclareGlobalFunction("Coproduct");


DeclareOperation("JoinOp",[IsList,IsPoset]);

#! @Arguments X_1,X_2,...
#! @Description The join of posets. It also computes the natural inclusion maps.
#! @BeginExampleSession
#! gap> A:=PosetByCoveringRelations([1,2,3,4], [[3,1],[3,2], [4,1],[4,2]]);
#! <finite poset of size 4>
#! gap> B:=PosetByCoveringRelations([1,2],[]);
#! <finite poset of size 2>
#! gap> SubPoset(A,[1,2]);
#! <finite poset of size 2>
#! gap> CoveringRelations(last);
#! [  ]
#! gap> C:=TheWallet();
#! <finite poset of size 11>
#! gap> J:=Join(A,B,C);
#! <finite poset of size 17>
#! gap> a:=Set(J)[1];; b:=J[6];;
#! gap> Ordering(J)(b,a);
#! true
#! @EndExampleSession
DeclareGlobalFunction("Join");


#! @Arguments X
#! @Description Returns the join of $X$ with the singleton poset. Equivalently, it adds a maximum to $X$.
#! @BeginExampleSession
#! gap> W:=TheWallet();
#! <finite poset of size 11>
#! gap> MaximumPoset(W);
#! fail
#! gap> coneW:=ConePoset(W);
#! <finite poset of size 12>
#! gap> Size(MaximalElements(coneW));
#! 1
#! @EndExampleSession
DeclareOperation("ConePoset",[IsPoset]);

#! @Arguments X
#! @Description The suspension of the poset $X$. It is the poset obtained by the join of $X$ with the discrete poset on two elements.
#! @BeginExampleSession
#! gap> P:=EmptyPoset();
#! <finite poset of size 0>
#! gap> S1P:=SuspensionPoset(P);
#! <finite poset of size 2>
#! gap> IsomorphismPosets(S1P,MinimalFiniteModelSphere(0));
#! <order preserving map>
#! gap> S2P:=SuspensionPoset(S1P);
#! <finite poset of size 4>
#! gap> IsomorphismPosets(S2P,MinimalFiniteModelSphere(1));
#! <order preserving map>
#! @EndExampleSession
DeclareOperation("SuspensionPoset",[IsPoset]);

#! @Arguments X
#! @Description The oppositve poset of $X$.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3], [[3,1], [3,2]]);
#! <finite poset of size 3>
#! gap> Pop:=OppositePoset(P);
#! <finite poset of size 3>
#! gap> IsomorphismPosets(P,Pop);
#! fail
#! @EndExampleSession
DeclareOperation("OppositePoset",[IsPoset]);

#! @Arguments f
#! @Description The mapping cylinder of an order preserving map $f:X\to Y$ is the poset $Zf$ whose underlying set is the disjoint union of $X$ and $Y$. The order in $Zf$ is given as following: it keeps the same order in $X$ and in $Y$, and if $x\in X$ and $y\in Y$, then $x < y$ if $f(x)\leq y$. This method also computes the following natural maps: the inclusions of $X$ and $Y$ in $Zf$, and the retraction of $Zf$ onto $Y$.
#! @BeginExampleSession
#! gap> A:=PosetByCoveringRelations([1,2,3,4], [[3,1],[3,2], [4,1],[4,2]]);
#! <finite poset of size 4>
#! gap> B:=PosetByCoveringRelations([1,2,3,4], [[4,2], [4,3], [2,1], [3,1]]);
#! <finite poset of size 4>
#! gap> f:=PosetHomomorphismByImages(A,B, [1, 2, 4, 4]);
#! <order preserving map>
#! gap> MappingCylinderPosetHomomorphism(f);
#! <finite poset of size 8>
#! gap> Zf:=last;
#! <finite poset of size 8>
#! @EndExampleSession
DeclareOperation("MappingCylinderPosetHomomorphism",[IsPosetHomomorphism]);

#! @Arguments X,A
#! @Description Returns the quotient set $X/A$ with the induced order. The subset $A$ must be convex: if $x < z < y$ with $x,y\in A$, then $z\in A$. See <Cite Key="BarmakBook" Where="Section 2.7"/> for further details.
#! @BeginExampleSession
#! gap> A:=PosetByCoveringRelations([1,2,3,4], [[4,3],[4,2],[3,1],[2,1]]);
#! <finite poset of size 4>
#! gap> B:=[1,4];
#! [ 1, 4 ]
#! gap> Q:=QuotientPoset(A,B);
#! The second parameter must be convex.
#! fail
#! gap> Q:=QuotientPoset(A,[4,5]);
#! The second parameter must be a list of elements of the first parameter.
#! fail
#! gap> Q:=QuotientPoset(A,[2,3]);
#! <finite poset of size 3>
#! @EndExampleSession
DeclareOperation("QuotientPoset",[IsPoset,IsList]);

#! @Arguments [X_1,x_1], [X_2,x_2],...
#! @Description Given a list of pairs $[X_i,x_i]$ where $X_i$ is a poset and $x_i\in X_i$, it returns the wedge of these posets on the given points. It also constructs the natural quotient map from the coproduct of the posets onto the wedge.
#! @BeginExampleSession
#! gap> A:=PosetByCoveringRelations([1,2,3,4], [[4,3],[4,2],[3,1],[2,1]]);
#! <finite poset of size 4>
#! gap> W:=WedgePosets([[A,4], [A,1]]);
#! <finite poset of size 7>
#! gap> IsContractible(W);
#! true
#! gap> NaturalMaps(W);
#! [ <order preserving map> ]
#! gap> q:=last[1];
#! <order preserving map>
#! gap> TargetMap(q) = W;
#! true
#! gap> SourceMap(q) = Coproduct(A,A);
#! true
#! @EndExampleSession
DeclareOperation("WedgePosets",[IsList]);

#! @Arguments X,Y
#! @Description The poset $Y^X$. Recall that this poset consists of the order preserving maps $f:X\to Y$ with $f\leq g$ if $f(x)\leq g(x)$ for all $x\in X$.
#! @BeginExampleSession
#! gap> S1:=MinimalFiniteModelSphere(1);
#! <finite poset of size 4>
#! gap> S2:=MinimalFiniteModelSphere(2);
#! <finite poset of size 6>
#! gap> P:=HomPosets(S2,S1);
#! <finite poset of size 44>
#! gap> Q:=HomPosets(S1,S2);
#! <finite poset of size 198>
#! @EndExampleSession
DeclareOperation("HomPosets",[IsPoset,IsPoset]);

#! @Arguments X
#! @Description The endomorphism poset of the poset $X$. Equivalently, the poset X^X.
#! @BeginExampleSession
#! gap> S1:=MinimalFiniteModelSphere(1);
#! <finite poset of size 4>
#! gap> Endo:=Endomorphisms(S1);
#! <finite poset of size 36>
#! gap> Endo = HomPosets(S1,S1);
#! true
#! gap> C:=Core(Endo);
#! <finite poset of size 8>
#! gap> Height(C);
#! 1
#! gap> PosetHomology(C);
#! [ [ 0, 0, 0, 0, 0 ], [ 0 ] ]
#! @EndExampleSession
DeclareAttribute("Endomorphisms",IsPoset);

#! @Arguments X
#! @Description The automorphism group $\mathrm{Aut}(X)$ of $X$.
#! @BeginExampleSession
#! gap> S1:=MinimalFiniteModelSphere(1);
#! <finite poset of size 4>
#! gap> AutomorphismGroup(S1);
#! C2 x C2
#! @EndExampleSession
DeclareAttribute("AutomorphismGroup",IsPoset);

#! @Arguments X
#! @Description The list of the poset automorphisms of $X$. The first element is the identity map.
#! @BeginExampleSession
#! gap> S1:=MinimalFiniteModelSphere(1);
#! <finite poset of size 4>
#! gap> A:=Automorphisms(S1);
#! [ <order preserving map>, <order preserving map>, <order preserving map>, <order preserving map> ]
#! gap> id:=IdentityMap(S1);
#! <order preserving map>
#! gap> id = A[1];
#! true
#! @EndExampleSession
DeclareAttribute("Automorphisms",IsPoset);

#! @Section Natural maps

#! @Arguments X
#! @Description Returns the natural maps of the poset X. For example NaturalMaps of a quotient gives the natural projection.
#! @BeginExampleSession
#! gap> S1:=MinimalFiniteModelSphere(1);
#! <finite poset of size 4>
#! gap> A:=MinimalElements(S1);;
#! gap> Q:=QuotientPoset(S1,A);
#! <finite poset of size 3>
#! gap> NaturalMaps(Q);
#! [ <order preserving map> ]
#! gap> f:=last[1];
#! <order preserving map>
#! gap> SourceMap(f) = S1;
#! true
#! gap> TargetMap(f) = Q;
#! true
#! @EndExampleSession
DeclareAttribute("NaturalMaps",IsPoset);

