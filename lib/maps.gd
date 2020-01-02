#! @Chapter Posets
#! @Section Homomorphisms

#! @Arguments X
#! @Description The identity $1_X\colon X\to X$.
#! @BeginExampleSession
#! gap> A:=PosetByCoveringRelations([1..4], [[3,1],[3,2], [4,1],[4,2]]);
#! <finite poset of size 4>
#! gap> id:=IdentityMap(A);
#! <order preserving map>
#! gap> 1^id;
#! 1
#! gap> 2^id;
#! 2
#! gap> 3^id;
#! 3
#! gap> 4^id;
#! 4
#! @EndExampleSession
DeclareAttribute("IdentityMap",IsPoset);

#! @BeginGroup Composition of homomorphisms
#! @Label Composition of homomorphisms
#! @Arguments f,g
#! @Description The composition $f\circ g$.
#! @BeginExampleSession
#! gap> A:=PosetByCoveringRelations([1..4], [[3,1],[3,2], [4,1],[4,2]]);
#! <finite poset of size 4>
#! gap> id:=IdentityMap(A);
#! <order preserving map>
#! gap> f:=PosetHomomorphismByImages(A,A, [2,1,4,3]);
#! <order preserving map>
#! gap> g:=CompositionPosetHomomorphisms(f,id);
#! <order preserving map>
#! gap> g = f;
#! true
#! gap> f2:=CompositionPosetHomomorphisms(f,f);
#! <order preserving map>
#! gap> f2 = id;
#! true
#! gap> h:=PosetHomomorphismByImages(EmptyPoset(),A,[]);
#! <order preserving map>
#! gap> CompositionPosetHomomorphisms(h,f);
#! fail
#! @EndExampleSession
DeclareOperation("CompositionPosetHomomorphisms",[IsPosetHomomorphism,IsPosetHomomorphism]);
#! @Arguments f,g
#! @Description The composition $f\circ g$ without any checks.
DeclareOperation("CompositionPosetHomomorphismsNC",[IsPosetHomomorphism,IsPosetHomomorphism]);
#! @Arguments f,g
#! @Description The composition $g\circ f$.
#! @BeginExampleSession
#! gap> A:=PosetByCoveringRelations([1..4], [[3,1],[3,2], [4,1],[4,2]]);
#! <finite poset of size 4>
#! gap> id:=IdentityMap(A);
#! <order preserving map>
#! gap> f:=PosetHomomorphismByImages(A,A, [2,1,4,3]);
#! <order preserving map>
#! gap> f*f = IdentityMap(A);
#! true
#! gap> f*id = f;
#! true
#! @EndExampleSession
DeclareOperation("\*",[IsPosetHomomorphism,IsPosetHomomorphism]);
#! @EndGroup

#! @Arguments f
#! @Description The source $X$ of a map $f\colon X\to Y$.
#! @BeginExampleSession
#! gap> A:=PosetByCoveringRelations([1..4], [[3,1],[3,2], [4,1],[4,2]]);
#! <finite poset of size 4>
#! gap> f:=PosetHomomorphismByImages(A,A, [2,1,4,3]);
#! <order preserving map>
#! gap> SourceMap(f) = A;
#! true
#! @EndExampleSession
DeclareOperation("SourceMap",[IsPosetHomomorphism]);

#! @Arguments f
#! @Description The target $Y$ of a map $f\colon X\to Y$.
#! @BeginExampleSession
#! gap> A:=PosetByCoveringRelations([1..4], [[3,1],[3,2], [4,1],[4,2]]);
#! <finite poset of size 4>
#! gap> f:=PosetHomomorphismByImages(A,A, [2,1,4,3]);
#! <order preserving map>
#! gap> TargetMap(f) = A;
#! true
#! @EndExampleSession
DeclareOperation("TargetMap",[IsPosetHomomorphism]);

#! @Arguments f
#! @Description A &GAP; function computing <C>f</C> as a set function.
#! @BeginExampleSession
#! gap> A:=PosetByCoveringRelations([1..4], [[3,1],[3,2], [4,1],[4,2]]);
#! <finite poset of size 4>
#! gap> f:=PosetHomomorphismByImages(A,A, [2,1,4,3]);
#! <order preserving map>
#! gap> uf:=UnderlyingFunction(f);
#! function( x ) ... end
#! gap> uf(1);
#! 2
#! gap> uf(2);
#! 1
#! @EndExampleSession
DeclareAttribute("UnderlyingFunction",IsPosetHomomorphism);

#! @BeginGroup
#! @Arguments f
#! @Description The inverse of the isomorphism f.
#! @BeginExampleSession
#! gap> A:=PosetByCoveringRelations([1..4], [[3,1],[3,2], [4,1],[4,2]]);
#! <finite poset of size 4>
#! gap> f:=PosetHomomorphismByImages(A,A, [2,1,4,3]);
#! <order preserving map>
#! gap> inv:=Inverse(f);
#! <order preserving map>
#! gap> inv = f;
#! true
#! @EndExampleSession
DeclareAttribute("Inverse",IsPosetHomomorphism);
#! @Arguments f
DeclareAttribute("InverseImmutable",IsPosetHomomorphism);
#! @EndGroup

#! @Arguments f
#! @Description The image $f(X)$ of a map $f\colon X\to Y$, given as a subposet of $Y$.
#! @BeginExampleSession
#! gap> A:=PosetByCoveringRelations([1..4], [[3,1],[3,2], [4,1],[4,2]]);
#! <finite poset of size 4>
#! gap> B:=PosetByCoveringRelations([5..8], [[7,5], [7,6], [8,5], [8,6]]);
#! <finite poset of size 4>
#! gap> h:=PosetHomomorphismByImages(A,B,[5,6,7,8]);
#! <order preserving map>
#! gap> ImageMap(h);
#! <finite poset of size 4>
#! gap> last = B;
#! true
#! @EndExampleSession
DeclareOperation("ImageMap",[IsPosetHomomorphism]);

#! @BeginGroup
#! @Description The image $f(x)$ of an element $x\in X$ by the map $f\colon X \to Y$.
#! @Arguments f,x
#! @BeginExampleSession
#! gap> A:=PosetByCoveringRelations([1..4], [[3,1],[3,2], [4,1],[4,2]]);
#! <finite poset of size 4>
#! gap> B:=PosetByCoveringRelations([5..8], [[7,5], [7,6], [8,5], [8,6]]);
#! <finite poset of size 4>
#! gap> h:=PosetHomomorphismByImages(A,B,[5,6,7,8]);
#! <order preserving map>
#! gap> ImageMap(h,1);
#! 5
#! gap> ImageMap(h,3);
#! 7
#! @EndExampleSession
DeclareOperation("ImageMap",[IsPosetHomomorphism,IsObject]);
#! @Arguments x,f
#! @Description The image $f(x)$ of an element $x\in X$ by the map $f\colon X \to Y$.
#! @BeginExampleSession
#! gap> A:=PosetByCoveringRelations([1..4], [[3,1],[3,2], [4,1],[4,2]]);
#! <finite poset of size 4>
#! gap> B:=PosetByCoveringRelations([5..8], [[7,5], [7,6], [8,5], [8,6]]);
#! <finite poset of size 4>
#! gap> h:=PosetHomomorphismByImages(A,B,[5,6,7,8]);
#! <order preserving map>
#! gap> 1^h;
#! 5
#! gap> 3^h;
#! 7
#! @EndExampleSession
DeclareOperation("\^",[IsObject,IsPosetHomomorphism]);
#! @EndGroup

# Not documented!
#! @Arguments L, f
#! @Description Given a list $L$ of poset homomorphisms, it return the list of the compositions $f\circ g$ for $g\in L$.
#! @BeginExampleSession
#! gap> A:=PosetByCoveringRelations([1..4], [[3,1],[3,2], [4,1],[4,2]]);;
#! gap> B:=PosetByCoveringRelations([5..8], [[7,5], [7,6], [8,5], [8,6]]);;
#! gap> f:=PosetHomomorphismByImages(A,A, [2,1,4,3]);;
#! gap> h:=PosetHomomorphismByImages(A,B,[5,6,7,8]);;
#! gap> [h,f] * f;
#! [ fail, <order preserving map> ]
#! gap> [Inverse(h), f] * h;
#! [ <order preserving map>, <order preserving map> ]
#! @EndExampleSession
DeclareOperation("\*",[IsList,IsPosetHomomorphism]);
#! @Arguments f, L
#! @Description Given a list $L$ of poset homomorphisms, it return the list of the compositions $g\circ f$ for $g\in L$.
#! @BeginExampleSession
#! gap> A:=PosetByCoveringRelations([1..4], [[3,1],[3,2], [4,1],[4,2]]);;
#! gap> B:=PosetByCoveringRelations([5..8], [[7,5], [7,6], [8,5], [8,6]]);;
#! gap> f:=PosetHomomorphismByImages(A,A, [2,1,4,3]);;
#! gap> h:=PosetHomomorphismByImages(A,B,[5,6,7,8]);;
#! gap> f *[h,f];
#! [ <order preserving map>, <order preserving map> ]
#! @EndExampleSession
DeclareOperation("\*",[IsPosetHomomorphism,IsList]);

#! @Label f^n
#! @Arguments f,n
#! @Description Returns $f^n$. If $n=0$ returns the identity. It works for $n&lt;0$ if $f$ is an isomorphism.
#! @BeginExampleSession
#! gap> A:=PosetByCoveringRelations([1..4], [[3,1],[3,2], [4,1],[4,2]]);;
#! gap> B:=PosetByCoveringRelations([5..8], [[7,5], [7,6], [8,5], [8,6]]);;
#! gap> f:=PosetHomomorphismByImages(A,A, [2,1,4,3]);;
#! gap> h:=PosetHomomorphismByImages(A,B,[5,6,7,8]);;
#! gap> gap> f^2;
#! <order preserving map>
#! gap> f^-2 = IdentityMap(A);
#! true
#! gap> h^2;
#! fail
#! @EndExampleSession
DeclareOperation("\^",[IsPosetHomomorphism,IsInt]);


#############################################################################

#! @Section Constructing poset homomorphisms in different ways

#! @Arguments X,Y,f
#! @Description Creates the order preserving map $f\colon X\to Y$ defined by the &GAP; function <A>f</A>.
DeclareOperation("PosetHomomorphismByFunction",[IsPoset,IsPoset,IsFunction]);

#! @Arguments X,Y,f
#! @Description Creates the order preserving map $f\colon X\to Y$ defined by the &GAP; function <A>f</A> without any checks.
DeclareOperation("PosetHomomorphismByFunctionNC",[IsPoset,IsPoset,IsFunction]);

#! @Arguments X,Y,ys
#! @Description Creates the order preserving map $f\colon X\to Y$ defined by $f(x) = ys[i]$ if <A>i = PositionSorted(Set(X),x)</A>.
#! @BeginExampleSession
#! gap> A:=PosetByCoveringRelations([1..4], [[3,1],[3,2], [4,1],[4,2]]);;
#! gap> B:=PosetByCoveringRelations([5..8], [[7,5], [7,6], [8,5], [8,6]]);;
#! gap> h:=PosetHomomorphismByImages(A,B,[5,6,7,8]);;
#! gap> List(Set(A), x->x^h);
#! [ 5, 6, 7, 8 ]
#! @EndExampleSession
DeclareOperation("PosetHomomorphismByImages",[IsPoset,IsPoset,IsList]);

#! @Arguments X,Y,f
DeclareOperation("PosetHomomorphismByMapping",[IsPoset,IsPoset,IsMapping]);

#! @Arguments X,Y
#! @Description An isomorphism between $X$ and $Y$ or fail if the posets are not isomorphic.
#! @BeginExampleSession
#! gap> A:=PosetByCoveringRelations([1..4], [[3,1],[3,2], [4,1],[4,2]]);;
#! gap> IsomorphismPosets(A,MinimalFiniteModelSphere(1));
#! <order preserving map>
#! gap> IsomorphismPosets(A,EmptyPoset());
#! fail
#! @EndExampleSession
DeclareOperation("IsomorphismPosets",[IsPoset,IsPoset]);


