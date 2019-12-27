gap> R1:=BinaryRelationOnPoints([[1,3,4], [2,3,4],[3],[4]]);
Binary Relation on 4 points
gap> IsPartialOrderBinaryRelation(R1);
true
gap> Q:=PosetByOrderRelation(R1);
<finite poset of size 4>
gap> S1:=MinimalFiniteModelSphere(1);
<finite poset of size 4>
gap> IsomorphismPosets(S1,Q);
<order preserving map>
gap> R2:=BinaryRelationOnPoints([[1,2,3], [2,3], [3]]);
Binary Relation on 3 points
gap> IsPartialOrderBinaryRelation(R2);
true
gap> P:=PosetByOrderRelation(R2);
<finite poset of size 3>