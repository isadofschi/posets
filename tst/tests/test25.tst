gap> S1:=MinimalFiniteModelSphere(1);
<finite poset of size 4>
gap> M:=OrderMatrix(S1);;
gap> Q:=PosetByOrderMatrix(M);
<finite poset of size 4>
gap> IsomorphismPosets(S1,Q);
<order preserving map>
gap> Set(Q);
[ 1 .. 4 ]
gap> Set(S1);
[ [ 1, "x" ], [ 1, "y" ], [ 2, "x" ], [ 2, "y" ] ]
gap> P:=PosetByOrderMatrix(["a","b","c","d"],M);
<finite poset of size 4>
gap> Set(P);
[ "a", "b", "c", "d" ]
gap> IsomorphismPosets(P,Q);
<order preserving map>