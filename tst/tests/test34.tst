gap> P:=PosetByCoveringRelations([1,2,3], [[3,1],[3,2]]);
<finite poset of size 3>
gap> ElementsAbove(P,1);
<finite poset of size 2>
gap> Set(ElementsAbove(P,1));
[ 1, 3 ]
gap> Set(ElementsBelow(P,3));
[ 1, 2, 3 ]
gap> Set(ElementsStrictlyAbove(P,1));
[ 3 ]
gap> Q:=ElementsStrictlyBelow(P,3);
<finite poset of size 2>
gap> Set(Q);
[ 1, 2 ]
gap> Q:=ElementsComparable(P,2);
<finite poset of size 2>
gap> Set(Q);
[ 2, 3 ]
gap> Q:=ElementsStrictlyComparable(P,3);
<finite poset of size 2>
gap> Set(Q);
[ 1, 2 ]
gap> Q:=RemovePoint(P,3);
<finite poset of size 2>
gap> Set(Q);
[ 1, 2 ]
gap> Q:=RemoveCoveringRelation(P,[3,1]);
<finite poset of size 3>
gap> CoveringRelations(Q);
[ [ 3, 2 ] ]
gap> IsBeatPoint(P,3);
false
gap> IsBeatPoint(P,1);
true
gap> IsUpBeatPoint(P,1);
true
gap> IsDownBeatPoint(P,1);
false
gap> UpBeatPoints(P);
[ 1, 2 ]
gap> DownBeatPoints(P);
[  ]
gap> BeatPoints(P);
[ 1, 2 ]
gap> Q:=Core(P);
<finite poset of size 1>
gap> N:=NaturalMaps(Q);
[ <order preserving map>, <order preserving map> ]
gap> inc:=N[1];
<order preserving map>
gap> ret:=N[2];
<order preserving map>
gap> SourceMap(inc) = Q;
true
gap> TargetMap(inc) = P;
true
gap> IsContractible(P);
true
gap> S:=PosetByCoveringRelations([1,2,3,4], [[3,1],[3,2],[4,1],[4,2]]);
<finite poset of size 4>
gap> S1:=MinimalFiniteModelSphere(1);
<finite poset of size 4>
gap> HomotopyEquivalence(S,S1);
<order preserving map>
gap> HomotopyEquivalence(S,P);
fail
