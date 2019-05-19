# The space k from Lemma 10 of "THE FIXED POINT PROPERTY IN EVERY WEAK HOMOTOPY TYPE" by J.A. Barmak
# These computations show that k is weakly homotopy equivalent to S^1
# k has the fixed point property but checking this with our current implementation would take too long
gap> points_k := [
> "x'", "y'", "x", "y",
> "z'", "w'",
> "p1", "p2", "p3", "p4",
> "z", "p5", "p6",  "w" ];;
gap> covering_relations_k := [
> ["x'","z'"], ["x'","p1"], ["x'","w'"], ["x'","p4"],
> ["y'","z'"], ["y'","w'"], ["y'","p2"], ["y'","p3"],
> ["x","p1"], ["x","p3"],
> ["y","p2"], ["y","p4"],
> ["z'","z"], ["z'","w"],
> ["w'","p5"], ["w'","p6"],
> ["p1","z"], ["p1","p5"],
> ["p2","z"], ["p2","p6"],
> ["p3","p5"], ["p3","w"],
> ["p4","p6"], ["p4","w"]];;
gap> k:=PosetByCoveringRelations(points_k,covering_relations_k);
<finite poset of size 14>
gap> Core(k);
<finite poset of size 14>
gap> HomotopyEquivalence(k,MinimalFiniteModelSphere(1));
fail
gap> IsDownWeakPoint(k,"x");
true
gap> IsDownWeakPoint(k,"y");
true
gap> k1:= SubPoset(k,Difference(Set(k),["x","y"]));
<finite poset of size 12>
gap> HomotopyEquivalence(k1,MinimalFiniteModelSphere(1));
<order preserving map>

