gap> L:=SimplicialComplex([[1,2],[1,3],[2,3]]);;
gap> XL:=FacePoset(L);
<finite poset of size 6>
gap> PosetHomology(XL);
[ [ 0 ], [ 0 ] ]
gap> FacePoset(OrderComplex(IdentityMap(XL)))=IdentityMap(BarycentricSubdivision(XL));
true
