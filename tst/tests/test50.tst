gap> P:=PosetByCoveringRelations([1..5], [[5,3],[5,2],[4,3],[4,2],[3,1],[2,1]]);
<finite poset of size 5>
gap> A:=SubPoset(P,[1,2,3]);
<finite poset of size 3>
gap> NaturalMaps(A);
[ <order preserving map> ]
gap> inc:=last[1];
<order preserving map>
gap> FixedPointsPosetHomomorphism(inc);
<finite poset of size 3>
gap> Set(last);
[ 1, 2, 3 ]
gap> HasFixedPointProperty(MinimalFiniteModelSphere(1));
false
gap> S1:=MinimalFiniteModelSphere(1);
<finite poset of size 4>
gap> g:=Grading(S1);
function( x ) ... end
gap> Min:=MinimalElements(S1);;
gap> a:=Min[1];;
gap> g(a);
0
gap> b:=Set(S1)[3];;
gap> g(b);
1
gap> Height(MinimalFiniteModelSphere(4));
4
gap> Height(MinimalFiniteModelSphere(5));
5
gap> Height(TheWallet());
2
gap> Q:=PosetByCoveringRelations([1..5],[[5,4],[5,3],[4,2],[3,1],[2,1]]);
<finite poset of size 5>
gap> Grading(Q);
fail
gap> Height(Q,5);
3
gap> ChainsPoset(P);
[ [ 1 ], [ 2 ], [ 3 ], [ 4 ], [ 5 ], [ 2, 1 ], [ 3, 1 ], [ 4, 1 ], [ 4, 2 ], [ 5, 1 ], [ 5, 2 ], [ 5, 3 ], [ 5, 4 ],
  [ 4, 2, 1 ], [ 5, 2, 1 ], [ 5, 3, 1 ], [ 5, 4, 1 ], [ 5, 4, 2 ], [ 5, 4, 2, 1 ] ]
