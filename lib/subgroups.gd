#! @Chapter Posets of subgroups of a finite group

#! @Section Posets of subgroups

#! @Arguments G
#! @Description The poset of subgroups of $G$.
#! @BeginExampleSession
#! gap> PosetOfSubgroups(AlternatingGroup(5));
#! <finite poset of size 59>
#! gap> PosetOfSubgroups(CyclicGroup(16));
#! <finite poset of size 5>
#! @EndExampleSession
DeclareOperation("PosetOfSubgroups", [IsGroup and IsFinite]);

#! @BeginGroup
#! @Description The poset $\mathcal{S}_p(G)$ of nontrivial $p$-subgroups of $G$, also known as the Brown poset of $G$.
#! @BeginExampleSession
#! gap> SpG:=BrownPoset(AlternatingGroup(5),2);
#! <finite poset of size 20>
#! gap> Core(SpG);
#! <finite poset of size 5>
#! @EndExampleSession
#! @Arguments G,p
DeclareOperation("PosetOfpSubgroups", [IsGroup and IsFinite,IsInt]);
#! @Arguments G,p
DeclareOperation("BrownPoset", [IsGroup and IsFinite,IsInt]);
#! @EndGroup

#! @Arguments G,p[, r]
#! @Description The list of nontrivial elementary abelian $p$-subgroups of $G$. If the optional parameter <A>r</A> is given, then it returns the nontrivial elementary abelian $p$-subgroups of rank at most $r$.
#! @BeginExampleSession
#! gap> ElementaryAbelianpSubgroups(AlternatingGroup(5),2);
#! [ Group([ (1,3)(2,4) ]), Group([ (1,4)(2,3) ]), Group([ (1,2)(3,4) ]), Group([ (1,2)(3,5) ]), Group([ (1,5)(2,3) ]),
#!   Group([ (1,3)(2,5) ]), Group([ (2,5)(3,4) ]), Group([ (2,3)(4,5) ]), Group([ (2,4)(3,5) ]), Group([ (1,3)(4,5) ]),
#!   Group([ (1,5)(3,4) ]), Group([ (1,4)(3,5) ]), Group([ (1,4)(2,5) ]), Group([ (1,5)(2,4) ]), Group([ (1,2)(4,5) ]),
#!   Group([ (1,3)(2,4), (1,2)(3,4) ]), Group([ (1,5)(2,3), (1,2)(3,5) ]), Group([ (2,4)(3,5), (2,3)(4,5) ]),
#!   Group([ (1,5)(3,4), (1,3)(4,5) ]), Group([ (1,4)(2,5), (1,2)(4,5) ]) ]
#! gap> ElementaryAbelianpSubgroups(AlternatingGroup(5),2,1);
#! [ Group([ (1,3)(2,4) ]), Group([ (1,4)(2,3) ]), Group([ (1,2)(3,4) ]), Group([ (1,2)(3,5) ]), Group([ (1,5)(2,3) ]),
#!   Group([ (1,3)(2,5) ]), Group([ (2,5)(3,4) ]), Group([ (2,3)(4,5) ]), Group([ (2,4)(3,5) ]), Group([ (1,3)(4,5) ]),
#!   Group([ (1,5)(3,4) ]), Group([ (1,4)(3,5) ]), Group([ (1,4)(2,5) ]), Group([ (1,5)(2,4) ]), Group([ (1,2)(4,5) ]) ]
#! @EndExampleSession
DeclareGlobalFunction("ElementaryAbelianpSubgroups");

#! @BeginGroup
#! @Description The poset $\mathcal{A}_p(G)$ of nontrivial elementary abelian $p$-subgroups of $G$, also known as the Quillen poset of $G$.
#! @BeginExampleSession
#! gap> ApG:=QuillenPoset(AlternatingGroup(6),2);
#! <finite poset of size 75>
#! @EndExampleSession
#! @Arguments G,p
DeclareOperation("PosetOfElementaryAbelianpSubgroups", [IsGroup and IsFinite,IsInt]);
#! @Arguments G,p
DeclareOperation("QuillenPoset", [IsGroup and IsFinite,IsInt]);
#! @EndGroup

#! @Arguments G,p
#! @Description The radical $p$-subgroups of $G$. Recall that a $p$-subgroup $H$ of $G$ is <E>radical</E> if $H=O_p(N_G(H))$.
#! @BeginExampleSession
#! gap> RadicalpSubgroups(AlternatingGroup(5),2);
#! [ Group([ (1,3)(2,4), (1,2)(3,4) ]), Group([ (1,5)(2,3), (1,2)(3,5) ]), Group([ (2,4)(3,5), (2,3)(4,5) ]),
#!   Group([ (1,5)(3,4), (1,3)(4,5) ]), Group([ (1,4)(2,5), (1,2)(4,5) ]) ]
#! gap> List(last,Size);
#! [ 4, 4, 4, 4, 4 ]
#! @EndExampleSession
DeclareGlobalFunction("RadicalpSubgroups");

#! @BeginGroup
#! @Arguments G,p
#! @Description The poset $\mathcal{B}_p(G)$ of radical $p$-subgroups of a finite group <A>G</A>, also known as the Bouc poset.
#! @BeginExampleSession
#! gap> BpG:=BoucPoset(AlternatingGroup(6),2);
#! <finite poset of size 75>
#! gap> SpG:=BrownPoset(AlternatingGroup(6),2);
#! <finite poset of size 165>
#! gap> HomotopyEquivalence(SpG,BpG);
#! fail
#! @EndExampleSession
DeclareOperation("PosetOfRadicalpSubgroups", [IsGroup and IsFinite,IsInt]);
#! @Arguments G,p
DeclareOperation("BoucPoset", [IsGroup and IsFinite,IsInt]);
#! @EndGroup

#! @Arguments G,p
#! @Description The points of the Robinson poset $\mathcal{R}_p(G)$ are the chains $(H_1 &gt; H_2 &gt; \ldots  &gt; H_k)$ of $p$-subgroups such that for every $i$, $H_i \triangleleft H_1$. The ordering is given by inclusion.
#! @BeginExampleSession
#! gap> R:=RobinsonPoset(AlternatingGroup(6),2);
#! <finite poset of size 615>
#! gap> IsContractible(R);
#! false
#! @EndExampleSession
DeclareOperation("RobinsonPoset", [IsGroup and IsFinite,IsInt]);


#! @Arguments G,p
#! @Description 
#! @BeginExampleSession
#! gap> G:=SmallGroup(72,40);
#! <pc group of size 72 with 5 generators>
#! gap> B:=OrbitSubdivisionBoucPoset(G,2);
#! <finite poset of size 5>
#! gap> IsContractible(B);
#! true
#! @EndExampleSession
DeclareOperation("OrbitSubdivisionBoucPoset", [IsGroup and IsFinite,IsInt]);

#! @Arguments G,p
#! @Description 
#! @BeginExampleSession
#! gap> G:=SmallGroup(72,40);
#! <pc group of size 72 with 5 generators>
#! gap> A:=OrbitSubdivisionQuillenPoset(G,2);
#! <finite poset of size 9>
#! gap> IsContractible(A);
#! true
#! @EndExampleSession
DeclareOperation("OrbitSubdivisionQuillenPoset", [IsGroup and IsFinite,IsInt]);

#! @Arguments G,p
#! @Description 
#! @BeginExampleSession
#! gap> G:=SmallGroup(72,40);
#! <pc group of size 72 with 5 generators>
#! gap> S:=OrbitSubdivisionBrownPoset(G,2);
#! <finite poset of size 23>
#! gap> IsContractible(S);
#! true
#! gap> S2:=OrbitSubdivisionBrownPoset(PSL(2,7),2);
#! <finite poset of size 19>
#! gap> IsContractible(S2);
#! false
#! @EndExampleSession
DeclareOperation("OrbitSubdivisionBrownPoset", [IsGroup and IsFinite,IsInt]);


#! @Arguments G,p
#! @Description Returns the Euler characteristic of $\mathcal{A}_p(G)$ without computing the poset. This may be useful when the poset is too big.
DeclareOperation("EulerCharacteristicQuillenPoset",[IsGroup,IsInt]);

#! @Section Poset of subspaces of a vector space

#! @Arguments V
#! @Description The lattice of subspaces of the finite vector space $V$.
#! @BeginExampleSession
#! gap> V:=GF(2)^4;
#! ( GF(2)^4 )
#! gap> P:=PosetOfSubspaces(V);
#! <finite poset of size 67>
#! gap> MaximumPoset(P);
#! <vector space of dimension 4 over GF(2)>
#! gap> MinimumPoset(P);
#! <vector space of dimension 0 over GF(2)>
#! @EndExampleSession
DeclareOperation("PosetOfSubspaces", [IsVectorSpace and IsFinite]);

#! @Arguments V
#! @Description The poset of nontrivial proper subspaces of the finite vector space $V$.
#! @BeginExampleSession
#! gap> V:=GF(2)^4;
#! ( GF(2)^4 )
#! gap> Q:=PosetOfProperSubspaces(V);
#! <finite poset of size 65>
#! gap> PosetHomology(Q);
#! [ [ 0 ], [  ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
#!       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ]
#! @EndExampleSession
DeclareOperation("PosetOfProperSubspaces", [IsVectorSpace and IsFinite]);
