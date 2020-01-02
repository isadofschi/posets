#! @Chapter Homotopy theory

#! @Section Connectivity


#! @Arguments X,x,y
#! @Description A path from $x$ to $y$ in $X$ of the minimum possible length. Returns <C>fail</C> if $x$ and $y$ are not in the same connected component of $X$.
#! @BeginExampleSession
#! gap> A:=PosetByCoveringRelations([1..8], [[5,1], [5,2], [6,2], [6,3], [7,3], [7,4], [8,4], [8,1]]);
#! <finite poset of size 8>
#! gap> PathInPoset(A,1,4);
#! [ 1, 8, 4 ]
#! gap> PathInPoset(A,2,4);
#! [ 2, 5, 1, 8, 4 ]
#! gap> B:=PosetByCoveringRelations([1,2],[]);
#! <finite poset of size 2>
#! gap> PathInPoset(B,1,2);
#! fail
#! @EndExampleSession
DeclareOperation("PathInPoset",[IsPoset,IsObject,IsObject]);

#! @Arguments X
#! @Description The connected components of $X$, given as a list of subposets.
#! @BeginExampleSession
#! gap> S1:=MinimalFiniteModelSphere(1);;
#! gap> S2:=MinimalFiniteModelSphere(2);;
#! gap> C:=Coproduct(S1,S2);
#! <finite poset of size 10>
#! gap> pi0:=ConnectedComponents(C);
#! [ <finite poset of size 4>, <finite poset of size 6> ]
#! gap> IsomorphismPosets(S1,pi0[1]);
#! <order preserving map>
#! gap> IsomorphismPosets(S2,pi0[2]);
#! <order preserving map>
#! @EndExampleSession
DeclareOperation("ConnectedComponents",[IsPoset]);

#! @Section Fences and homotopies

#! Two maps $f,g\colon X\to Y$ are homotopic if and only if they are in the same connected component of $Y^X$ which is equivalent to the existence of a <E>fence</E> $f=h_0\leq h_1 \geq h_2\leq \cdots \geq h_n=g$, see <Cite Key="BarmakBook" Where="Section 1.2"/>.

# A shortest fence
#! @Arguments f,g
#! @Description Given $f,g\colon X\to Y$, if $f$ and $g$ are homotopic returns a fence (a path in $Y^X$) between $f$ and $g$ of the minimum possible length. Otherwise it returns <C>fail</C>.
#! @BeginExampleSession
#! gap> S1:=MinimalFiniteModelSphere(1);;
#! gap> point:=Set(S1)[1];;
#! gap> f:=PosetHomomorphismByImages(S1, S1, List(Set(S1),x->point));
#! <order preserving map>
#! gap> Fence(f,IdentityMap(S1));
#! fail
#! gap> A:=ConePoset(S1);
#! <finite poset of size 5>
#! gap> p:=MaximumPoset(A);;
#! gap> g:=PosetHomomorphismByImages(A, A, List(Set(A),x->p));
#! <order preserving map>
#! gap> Fence(g,IdentityMap(A));
#! [ <order preserving map>, <order preserving map> ]
#! @EndExampleSession
DeclareOperation("Fence",[IsPosetHomomorphism,IsPosetHomomorphism]);

#! @Arguments f,g
#! @Description Given $f,g\colon X\to Y$, returns <C>true</C> if $f\simeq g$, <C>false</C> otherwise.
#! gap> S1:=MinimalFiniteModelSphere(1);;
#! gap> point:=Set(S1)[1];;
#! gap> f:=PosetHomomorphismByImages(S1, S1, List(Set(S1),x->point));
#! <order preserving map>
#! gap> AreHomotopic(f,IdentityMap(S1));
#! false
#! gap> A:=ConePoset(S1);
#! <finite poset of size 5>
#! gap> p:=MaximumPoset(A);;
#! gap> g:=PosetHomomorphismByImages(A, A, List(Set(A),x->p));
#! <order preserving map>
#! gap> AreHomotopic(g,IdentityMap(A));
#! true
#! @EndExampleSession
DeclareOperation("AreHomotopic",[IsPosetHomomorphism,IsPosetHomomorphism]);


