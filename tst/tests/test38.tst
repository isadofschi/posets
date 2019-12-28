gap> G:=SmallGroup(72,40);
<pc group of size 72 with 5 generators>
gap> SpG:=BrownPoset(G,2);
<finite poset of size 57>
gap> Q:=Core(SpG);
<finite poset of size 21>
gap> K:=OrderComplex(Q);
Simplicial complex of dimension 1.

gap> L:=OrderComplex(SpG);
Simplicial complex of dimension 2.

gap> inc:=NaturalMaps(Q)[1];
<order preserving map>
gap> Kinc:=OrderComplex(inc);
Simplicial Map

gap> XKinc:=FacePoset(Kinc);
<order preserving map>
gap> SdQ:=FacePoset(K);
<finite poset of size 57>
gap> SdSpG:=FacePoset(L);
<finite poset of size 255>
gap> QQ:=BarycentricSubdivision(Q);
<finite poset of size 57>
gap> SdQ = QQ;
true
gap> BarycentricSubdivision(L);
Simplicial complex of dimension 2.

gap> Sdinc:=BarycentricSubdivision(inc);
<order preserving map>
gap> TargetMap(Sdinc) = SdSpG;
true