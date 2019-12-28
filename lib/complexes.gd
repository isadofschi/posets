#! @Chapter Topology

#! @Section Face poset and order complex
#! Given a finite poset $X$, its order complex $\mathcal{K}(X)$ is the simplicial complex whose vertices are the elements of $X$ and whose simplices are the nonempty totally ordered subsets of $X$.
#! If $K$ is a finite simplicial complex, then its face poset $\mathcal{X}(K)$ is the finite poset whose elements are the simplices of $K$ and the order given by inclusion.

#######################################################

#! @Arguments K
#! @Description Returns the face poset of the simplicial complex $K$.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3,4], [[2,1], [3,1], [4,2], [4,3]]);
#! <finite poset of size 4>
#! gap> K:=OrderComplex(P);
#! Simplicial complex of dimension 2.
#! 
#! gap> PP:=FacePoset(K);
#! <finite poset of size 11>
#! gap> Set(PP);
#! [ [ 1 ], [ 1, 2 ], [ 1, 2, 4 ], [ 1, 3 ], [ 1, 3, 4 ], [ 1, 4 ], [ 2 ], [ 2, 4 ], [ 3 ], [ 3, 4 ], [ 4 ] ]
#! @EndExampleSession
DeclareOperation("FacePoset",[IsHapSimplicialComplex]);

#! @Arguments X
#! @Description Returns the order complex of the finite poset $X$.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3,4], [[2,1], [3,1], [4,2], [4,3]]);
#! <finite poset of size 4>
#! gap> K:=OrderComplex(P);
#! Simplicial complex of dimension 2.
#! 
#! gap> K!.vertices;
#! [ 1, 2, 3, 4 ]
#! gap> g:=K!.simplices;
#! function( n, i ) ... end
#! gap> g(1,1);
#! [ 1, 2 ]
#! gap> g(1,2);
#! [ 1, 3 ]
#! @EndExampleSession
DeclareOperation("OrderComplex",[IsPoset]);

#! @Arguments f
#! @Description The map $\mathcal{X}(f)$ induced by the simplicial map $f$ in the face posets.
#! @BeginExampleSession
#! gap> G:=SmallGroup(72,40);
#! <pc group of size 72 with 5 generators>
#! gap> SpG:=BrownPoset(G,2);
#! <finite poset of size 57>
#! gap> Q:=Core(SpG);
#! <finite poset of size 21>
#! gap> K:=OrderComplex(Q);
#! Simplicial complex of dimension 1.
#! 
#! gap> L:=OrderComplex(SpG);
#! Simplicial complex of dimension 2.
#! 
#! gap> inc:=NaturalMaps(Q)[1];
#! <order preserving map>
#! gap> Sdinc:=FacePoset(OrderComplex(inc));
#! <order preserving map>
#! @EndExampleSession
DeclareOperation("FacePoset",[IsHapSimplicialMap]);

#! @Arguments f
#! @Description The map $\mathcal{K}(f)$ induced by the poset map $f$ in the order complexes.
#! @BeginExampleSession
#! gap> G:=SmallGroup(72,40);
#! <pc group of size 72 with 5 generators>
#! gap> SpG:=BrownPoset(G,2);
#! <finite poset of size 57>
#! gap> Q:=Core(SpG);
#! <finite poset of size 21>
#! gap> K:=OrderComplex(Q);
#! Simplicial complex of dimension 1.
#! 
#! gap> L:=OrderComplex(SpG);
#! Simplicial complex of dimension 2.
#! 
#! gap> ret:=NaturalMaps(Q)[2];
#! <order preserving map>
#! gap> Kret:=OrderComplex(ret);
#! Simplicial Map
#! 
#! @EndExampleSession
DeclareOperation("OrderComplex",[IsPosetHomomorphism]);

#######################################################

#! @Arguments X
#! @Description The barycentric subdvidision of the poset $X$, which is the poset $\mathcal{X}(\mathcal{K}(X))$.
#! @BeginExampleSession
#! gap> W:=TheWallet();
#! <finite poset of size 11>
#! gap> SdW:=BarycentricSubdivision(W);
#! <finite poset of size 53>
#! gap> SdW = FacePoset(OrderComplex(W));
#! true
#! @EndExampleSession
DeclareOperation("BarycentricSubdivision",[IsPoset]);

#! @Arguments K
#! @Description The barycentric subdvidision of the simplicial complex $K$, which is the simplicial complex $\mathcal{K}(\mathcal{X}(K))$.
#! @BeginExampleSession
#! gap> W:=TheWallet();
#! <finite poset of size 11>
#! gap> K:=OrderComplex(W);
#! Simplicial complex of dimension 2.
#! 
#! gap> SdK:=BarycentricSubdivision(K);
#! Simplicial complex of dimension 2.
#! 
#! @EndExampleSession
DeclareOperation("BarycentricSubdivision",[IsHapSimplicialComplex]);

#! @Arguments f
#! @Description The induced map between the barycentric subdivisions of the simplicial complexes.
#! @BeginExampleSession
#! @EndExampleSession
DeclareOperation("BarycentricSubdivision",[IsHapSimplicialMap]);

#! @Arguments f
#! @Description The induced map between the barycentric subdivisions of the posets.
#! @BeginExampleSession
#! gap> G:=SmallGroup(72,40);
#! <pc group of size 72 with 5 generators>
#! gap> SpG:=BrownPoset(G,2);
#! <finite poset of size 57>
#! gap> Q:=Core(SpG);
#! <finite poset of size 21>
#! gap> inc:=NaturalMaps(Q)[1];
#! <order preserving map>
#! gap> SdSpG:=BarycentricSubdivision(SpG);
#! <finite poset of size 255>
#! gap> Sdinc:=BarycentricSubdivision(inc);
#! <order preserving map>
#! gap> TargetMap(Sdinc) = SdSpG;
#! true
#! @EndExampleSession
DeclareOperation("BarycentricSubdivision",[IsPosetHomomorphism]);

#######################################################

#! @Section Homology

#! @Arguments X
#! @Description The homology $H_*(X)$.
#! @BeginExampleSession
#! gap> W:=TheWallet();
#! <finite poset of size 11>
#! gap> PosetHomology(W);
#! [ [ 0 ], [  ], [  ] ]
#! gap> PosetHomology(MinimalFiniteModelSphere(2));
#! [ [ 0 ], [  ], [ 0 ] ]
#! @EndExampleSession
DeclareOperation("PosetHomology",[IsPoset]);

#! @Arguments X,n
#! @Description The homology group $H_n(X)$.
#! @BeginExampleSession
#! gap> W:=TheWallet();
#! <finite poset of size 11>
#! gap> PosetHomology(W,1);
#! [  ]
#! gap> PosetHomology(W,0);
#! [ 0 ]
#! gap> PosetHomology(MinimalFiniteModelSphere(2),2);
#! [ 0 ]
#! @EndExampleSession
DeclareOperation("PosetHomology",[IsPoset,IsInt]);

#! @Arguments f,n
#! @Description The induced map $H_n(f)$ between the homology groups of grade $n$ by the poset map $f$.
#! @BeginExampleSession
#! @EndExampleSession
DeclareOperation("PosetHomology",[IsPosetHomomorphism,IsInt]);

#######################################################

#! @Section More invariants

#! @Arguments X
#! @Description Computes the Euler Characteristic of the poset.
#! @BeginExampleSession
#! gap> EulerCharacteristic(MinimalFiniteModelSphere(3));
#! 0
#! gap> EulerCharacteristic(MinimalFiniteModelSphere(4));
#! 2
#! gap> EulerCharacteristic(TheWallet());
#! 1
#! @EndExampleSession
DeclareAttribute("EulerCharacteristic",IsPoset);

#! @Arguments X
#! @Description Computes the fundamental group of the poset, which is the fundamental group of its order complex.
#! @BeginExampleSession
#! gap> FundamentalGroup(TheWallet());
#! <fp group on the generators [  ]>
#! gap> Order(last);
#! 1
#! gap> F:=FundamentalGroup(MinimalFiniteModelSphere(1));
#! <fp group of size infinity on the generators [ f1 ]>
#! gap> RelatorsOfFpGroup(F);
#! [  ]
#! gap> GeneratorsOfGroup(F);
#! [ f1 ]
#! @EndExampleSession
DeclareOperation("FundamentalGroup",[IsPoset]);


