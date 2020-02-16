gap> G:=AlternatingGroup(5);
Alt( [ 1 .. 5 ] )
gap> S:=AllSubgroups(G);;
gap> P:=PosetByFunction(S, IsSubgroup);
<finite poset of size 59>
gap> Q:=PosetOfSubgroups(G);
<finite poset of size 59>
gap> P=Q;
true
gap> A:=PosetByFunction(S,IsSubgroup);;
gap> B:=PosetByFunctionNC(S,IsSubgroup);;
gap> A=B;
true

