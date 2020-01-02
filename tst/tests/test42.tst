gap> A:=PosetByCoveringRelations([1,2,3,4], [[4,3],[4,2],[3,1],[2,1]]);
<finite poset of size 4>
gap> B:=[1,4];
[ 1, 4 ]
gap> Q:=QuotientPoset(A,B);
The second parameter must be convex.
fail
gap> Q:=QuotientPoset(A,[4,5]);
The second parameter must be a list of elements of the first parameter.
fail
gap> Q:=QuotientPoset(A,[2,3]);
<finite poset of size 3>