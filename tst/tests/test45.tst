gap> A:=PosetByCoveringRelations([1..8], [[5,1], [5,2], [6,2], [6,3], [7,3], [7,4], [8,4], [8,1]]);
<finite poset of size 8>
gap> PathInPoset(A,1,4);
[ 1, 8, 4 ]
gap> PathInPoset(A,2,4);
[ 2, 5, 1, 8, 4 ]
gap> B:=PosetByCoveringRelations([1,2],[]);
<finite poset of size 2>
gap> PathInPoset(B,1,2);
fail
gap> cc:=ConnectedComponents(B);
[ <finite poset of size 1>, <finite poset of size 1> ]
gap> 1 in cc[1];
true
gap> 2 in cc[2];
true
gap> S1:=MinimalFiniteModelSphere(1);;
gap> point:=Set(S1)[1];;
gap> f:=PosetHomomorphismByImages(S1,S1, List(Set(S1),x->point));
<order preserving map>
gap> Fence(f,IdentityMap(S1));
fail
gap> A:=ConePoset(S1);
<finite poset of size 5>
gap> p:=MaximumPoset(A);;
gap> g:=PosetHomomorphismByImages(A,A, List(Set(A),x->p));
<order preserving map>
gap> Fence(g,IdentityMap(A));
[ <order preserving map>, <order preserving map> ]
gap> AreHomotopic(f,IdentityMap(S1));
false
gap> AreHomotopic(g,IdentityMap(A));
true
