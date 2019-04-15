gap> L:=SimplicialComplex([[1,2,3]]);;
gap> XL:=FacePoset(L);
<finite poset of size 7>
gap> KXL:=OrderComplex(XL);;
gap> Homology(KXL);
[ [ 0 ], [  ], [  ] ]
gap> PosetHomology(XL);
[ [ 0 ], [  ], [  ] ]

