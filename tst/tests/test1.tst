gap> L:=SC([[1,2,3]]);;
gap> XL:=FacePoset(L);
<finite poset of size 7>
gap> KXL:=OrderComplex(XL);;
gap> SCHomology(KXL);
[ [ 0, [  ] ], [ 0, [  ] ], [ 0, [  ] ] ]
gap> PosetHomology(XL);
[ [ 0, [  ] ], [ 0, [  ] ], [ 0, [  ] ] ]

