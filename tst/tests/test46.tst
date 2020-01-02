gap> A:=PosetByCoveringRelations([1..4], [[3,1],[3,2], [4,1],[4,2]]);
<finite poset of size 4>
gap> id:=IdentityMap(A);
<order preserving map>
gap> 1^id;
1
gap> 2^id;
2
gap> 3^id;
3
gap> 4^id;
4
gap> f:=PosetHomomorphismByImages(A,A, [2,1,4,3]);
<order preserving map>
gap> g:=CompositionPosetHomomorphisms(f,id);
<order preserving map>
gap> g = f;
true
gap> f2:=CompositionPosetHomomorphisms(f,f);
<order preserving map>
gap> f2 = id;
true
gap> h:=PosetHomomorphismByImages(EmptyPoset(),A,[]);
<order preserving map>
gap> CompositionPosetHomomorphisms(h,f);
fail
gap> f*f = IdentityMap(A);
true
gap> f*id = f;
true
gap> g *f = h * f;
false
gap> uf:=UnderlyingFunction(f);
function( x ) ... end
gap> uf(1);
2
gap> uf(2);
1
gap> inv:=Inverse(f);
<order preserving map>
gap> inv = f;
true
gap> B:=PosetByCoveringRelations([5..8], [[7,5], [7,6], [8,5], [8,6]]);
<finite poset of size 4>
gap> h:=PosetHomomorphismByImages(A,B,[5,6,7,8]);
<order preserving map>
gap> Inverse(h);
<order preserving map>
gap> ImageMap(h);
<finite poset of size 4>
gap> last = B;
true
gap> ImageMap(h,1);
5
gap> ImageMap(h,3);
7
gap> [h,f] * f;
[ fail, <order preserving map> ]
gap> f *[h,f];
[ <order preserving map>, <order preserving map> ]
gap> [Inverse(h), f] * h;
[ <order preserving map>, <order preserving map> ]
gap> f^2;
<order preserving map>
gap> h^2;
fail
gap> f^-2 = IdentityMap(A);
true

