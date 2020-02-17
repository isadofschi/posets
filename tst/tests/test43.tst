gap> A:=PosetByCoveringRelations([1,2,3,4], [[4,3],[4,2],[3,1],[2,1]]);
<finite poset of size 4>
gap> W:=WedgePosets([[A,4], [A,1]]);
<finite poset of size 7>
gap> IsContractible(W);
true
gap> NaturalMaps(W);
[ <order preserving map>, <order preserving map> ]
gap> f:=NaturalMaps(W)[1];;
gap> TargetMap(f) = W;
true
gap> SourceMap(f)=A;
true

