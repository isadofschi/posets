gap> X1:=FacePoset(SimplicialComplex([[1,2,3]]));
<finite poset of size 7>
gap> R:=RelationByPoset(X1);;
gap> X2:=PosetByOrderRelation(R);
<finite poset of size 7>
gap> IsomorphismPosets(X1,X2);
<order preserving map>
gap> CoveringRelations(X2);
[ [ 2, 1 ], [ 2, 5 ], [ 3, 2 ], [ 3, 4 ], [ 3, 6 ], [ 4, 1 ], 
  [ 4, 7 ], [ 6, 5 ], [ 6, 7 ] ]
gap> Set(X2);
[ 1, 2, 3, 4, 5, 6, 7 ]
