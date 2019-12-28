gap> W:=TheWallet();
<finite poset of size 11>
gap> PosetHomology(W);
[ [ 0 ], [  ], [  ] ]
gap> PosetHomology(MinimalFiniteModelSphere(2));
[ [ 0 ], [  ], [ 0 ] ]
gap> PosetHomology(W,1);
[  ]
gap> PosetHomology(W,0);
[ 0 ]
gap> PosetHomology(MinimalFiniteModelSphere(2),2);
[ 0 ]
gap> A:=PosetByCoveringRelations([1,2,3,4], [[3,1],[3,2], [4,1],[4,2]]);
<finite poset of size 4>
gap> B:=PosetByCoveringRelations([1,2,3,4], [[4,2], [4,3], [2,1], [3,1]]);
<finite poset of size 4>
gap> f:=PosetHomomorphismByImages(A,B, [1, 2, 4, 4]);
<order preserving map>
gap> EulerCharacteristic(MinimalFiniteModelSphere(3));
0
gap> EulerCharacteristic(MinimalFiniteModelSphere(4));
2
gap> EulerCharacteristic(TheWallet());
1
