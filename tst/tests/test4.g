gap> X1:=FacePoset(SC([[1,2,3]]));
<finite poset of size 7>
gap> R:=RelationByPoset(X1);;
gap> X2:=PosetByOrderRelation(R);
<finite poset of size 7>
gap> HasseDiagram(X2);
gap> X2!.names;
[ [ 1 ], [ 1, 2 ], [ 1, 2, 3 ], [ 1, 3 ], [ 2 ], [ 2, 3 ], [ 3 ] ]
gap> X2!.HasseDiagramNames;
[ [  ], [ [ 1 ], [ 2 ] ], [ [ 1, 2 ], [ 1, 3 ], [ 2, 3 ] ], [ [ 1 ], [ 3 ] ], 
  [  ], [ [ 2 ], [ 3 ] ], [  ] ]
gap> X2!.HasseDiagramNumbers;
[ [  ], [ 1, 5 ], [ 2, 4, 6 ], [ 1, 7 ], [  ], [ 5, 7 ], [  ] ]

