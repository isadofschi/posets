gap> rel:=[[1,3], [1,4], [2,3], [2,4]];
[ [ 1, 3 ], [ 1, 4 ], [ 2, 3 ], [ 2, 4 ] ]
gap> Q:=PosetByCoveringRelations([1,2,3,4],rel);
<finite poset of size 4>
gap> S1:=MinimalFiniteModelSphere(1);
<finite poset of size 4>
gap> IsomorphismPosets(S1,Q);
<order preserving map>
