gap> G:=AlternatingGroup(8);
Alt( [ 1 .. 8 ] )
gap> ApG:=QuillenPoset(G,2);
<finite poset of size 2655>
gap> start:=Runtime();; Q:=Core(ApG);; Runtime()-start; 
90996
gap> start:=Runtime();; R:=CoreParallel(ApG);; Runtime()-start;
# Remaining points: 1710
# Remaining points: 1010
184
gap> Set(Q) = Set(R);
true