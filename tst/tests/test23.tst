gap> P:=PosetByCoveringRelations([1,2,3,4],[]);
<finite poset of size 4>
gap> Q:=PosetByCoveringRelations([1,2,3,4], [[1,3],[1,4],[2,3],[2,4]]);
<finite poset of size 4>
gap> S1:=MinimalFiniteModelSphere(1);
<finite poset of size 4>
gap> \=(P,Q);
false
gap> \=(Q,S1);
false
gap> IsomorphismPosets(Q,S1);
<order preserving map>
gap> \=(P,P);
true
gap> P = P;
true
gap> Q = P;
false
