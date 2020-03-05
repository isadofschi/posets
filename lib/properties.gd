#! @Chapter Topology
#! @Section Fixed Point Property


#! @Arguments f
#! @Description Returns the subposet of fixed points of <A>f</A>. We only check names of points, Source(f) is not neccesarily equal to Target(f).
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1..5], [[5,3],[5,2],[4,3],[4,2],[3,1],[2,1]]);
#! <finite poset of size 5>
#! gap> A:=SubPoset(P,[1,2,3]);
#! <finite poset of size 3>
#! gap> N:=NaturalMaps(A);
#! [ <order preserving map> ]
#! gap> inc:=N[1];
#! <order preserving map>
#! gap> F:=FixedPointsPosetHomomorphism(inc);
#! <finite poset of size 3>
#! gap> Set(F);
#! [ 1, 2, 3 ]
#! @EndExampleSession
DeclareAttribute("FixedPointsPosetHomomorphism",IsPosetHomomorphism);

#! @Arguments X
#! @Description Returns <C>true</C> if every order preserving map $f\colon X \to X$ has a fixed point, <C>false</C> otherwise.
#! @BeginExampleSession
#! gap> HasFixedPointProperty(MinimalFiniteModelSphere(1));
#! false
#! @EndExampleSession
DeclareProperty("HasFixedPointProperty",IsPoset);

#! @Chapter Classical stuff
#! @Section Grading and height

#! @Arguments X
#! @Description Returns a grading if the poset <A>X</A> is graded and <C>fail</C> otherwise. The grading is chosen so that the minimum grade is 0.
#! @BeginExampleSession
#! gap> S1:=MinimalFiniteModelSphere(1);
#! <finite poset of size 4>
#! gap> g:=Grading(S1);
#! function( x ) ... end
#! gap> Min:=MinimalElements(S1);;
#! gap> a:=Min[1];;
#! gap> g(a);
#! 0
#! gap> b:=Set(S1)[3];;
#! gap> g(b);
#! 1
#! @EndExampleSession
DeclareAttribute("Grading",IsPoset);

#! @Arguments X,x
#! @Description The Height of a point in a poset.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1..5],[[5,4],[5,3],[4,2],[3,1],[2,1]]);
#! <finite poset of size 5>
#! gap> Grading(P);
#! fail
#! gap> Height(P,5);
#! 3
#! @EndExampleSession
DeclareOperation("Height",[IsPoset,IsObject]);

#! @Arguments X
#! @Description The height of a poset.
#! @BeginExampleSession
#! gap> Height(MinimalFiniteModelSphere(4));
#! 4
#! gap> Height(MinimalFiniteModelSphere(5));
#! 5
#! gap> Height(TheWallet());
#! 2
#! @EndExampleSession
DeclareAttribute("Height",IsPoset);

#! @Arguments X
#! @Description The (not necessarily ordered) list of chains of <A>X</A>. Each chain is represented as a list of points, ordered according to the order on <A>X</A>, the first element being the maximum of the chain.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1..5],[[5,4],[5,3],[4,2],[3,1],[2,1]]);
#! <finite poset of size 5>
#! gap> ChainsPoset(P);
#! [ [ 1 ], [ 2 ], [ 3 ], [ 4 ], [ 5 ], [ 2, 1 ], [ 3, 1 ], [ 4, 1 ], [ 4, 2 ], [ 5, 1 ], [ 5, 2 ], [ 5, 3 ], [ 5, 4 ],
#!   [ 4, 2, 1 ], [ 5, 2, 1 ], [ 5, 3, 1 ], [ 5, 4, 1 ], [ 5, 4, 2 ], [ 5, 4, 2, 1 ] ]
#! @EndExampleSession
DeclareOperation("ChainsPoset",[IsPoset]);

#!
DeclareAttribute("MobiusMatrix",IsPoset);

#! @Arguments X
#! @Description The Mobius function $\mu$ of $X$.
DeclareAttribute("MobiusFunction",IsPoset);
