gap> S1:=MinimalFiniteModelSphere(1);
<finite poset of size 4>
gap> S2:=MinimalFiniteModelSphere(2);
<finite poset of size 6>
gap> P:=HomPosets(S2,S1);
<finite poset of size 44>
gap> Q:=HomPosets(S1,S2);
<finite poset of size 198>
gap> Endo:=Endomorphisms(S1);
<finite poset of size 36>
gap> Endo = HomPosets(S1,S1);
true
gap> C:=Core(Endo);
<finite poset of size 8>
gap> Height(C);
1
gap> PosetHomology(C);
[ [ 0, 0, 0, 0, 0 ], [ 0 ] ]
gap> A:=AutomorphismGroup(S1);
C2 x C2
gap> A:=Automorphisms(S1);
[ <order preserving map>, <order preserving map>, <order preserving map>, <order preserving map> ]
gap> id:=IdentityMap(S1);
<order preserving map>
gap> id = A[1];
true
