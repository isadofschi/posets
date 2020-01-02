gap> A:=PosetByCoveringRelations([1,2,3,4], [[4,3],[4,2],[3,1],[2,1]]);
<finite poset of size 4>
gap> A1:=A;
<finite poset of size 4>
gap> A2:=A;
<finite poset of size 4>
gap> W:=WedgePosets([[A1,4], [A2,1]]);
<finite poset of size 7>
gap> IsContractible(W);
true
gap> NaturalMaps(W);
[ <order preserving map> ]
gap> f:=last[1];
<order preserving map>
gap> TargetMap(f) = W;
true
gap> S:=SourceMap(f);
<finite poset of size 8>
gap> NaturalMaps(S);
[ <order preserving map>, <order preserving map> ]
gap> Coproduct(A1,A2) = SourceMap(f);
true
