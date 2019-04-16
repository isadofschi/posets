gap> X1:=FacePoset(SimplicialComplex([[1,2,3]]));
<finite poset of size 7>
gap> R:=RelationByPoset(X1);;
gap> X2:=PosetByOrderRelation(R);
<finite poset of size 7>
gap> X2=X1;
true
gap> HasseDiagram(X2);
[ [  ], [ [ 1 ], [ 2 ] ], [ [ 1, 2 ], [ 1, 3 ], [ 2, 3 ] ], [ [ 1 ], [ 3 ] ], 
  [  ], [ [ 2 ], [ 3 ] ], [  ] ]
gap> Set(X2);
[ [ 1 ], [ 1, 2 ], [ 1, 2, 3 ], [ 1, 3 ], [ 2 ], [ 2, 3 ], [ 3 ] ]
