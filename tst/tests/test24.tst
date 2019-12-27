gap> G:=AlternatingGroup(5);
Alt( [ 1 .. 5 ] )
gap> S:=AllSubgroups(G);;
gap> P:=PosetByFunction(S, IsSubgroup);
<finite poset of size 59>
gap> Q:=PosetOfSubgroups(G);
<finite poset of size 59>
gap> \=(P,Q);
true
gap> start:=Runtime();; A:=PosetByFunction(S,IsSubgroup);; Runtime()-start;
624
gap> start:=Runtime();; B:=PosetByFunctionNC(S,IsSubgroup);; Runtime()-start;
0
gap> \=(A,B);
true


