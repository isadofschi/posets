gap> G:=AlternatingGroup(8);
Alt( [ 1 .. 8 ] )
gap> ApG:=QuillenPoset(G,2);
<finite poset of size 2655>
gap> Q:=Core(ApG);;
gap> R:=CoreParallel(ApG);;
# Remaining points: 1710
# Remaining points: 1010
gap> Set(Q) = Set(R);
true
