#! @Chapter Posets of subgroups of a finite group

#! @Section Posets of subgroups

#! @Arguments G
#! The poset of subgroups of $G$.
DeclareOperation("PosetOfSubgroups", [IsGroup and IsFinite]);

#! @Arguments G,p
#! The poset of nontrivial $p$-subgroups of $G$.
DeclareOperation("PosetOfpSubgroups", [IsGroup and IsFinite,IsInt]);

#! @Arguments G,p
#! @Description The nontrivial elementary abelian $p$-subgroups of $G$.
DeclareGlobalFunction("ElementaryAbelianpSubgroups");

#! @Arguments G,p
#! @Description The poset of nontrivial elementary abelian $p$-subgroups of $G$.
DeclareOperation("PosetOfElementaryAbelianpSubgroups", [IsGroup and IsFinite,IsInt]);

#! @Arguments G,p
#! @Description The radical $p$-subgroups of $G$. Recall that a $p$-subgroup $H$ of $G$ is <E>radical</E> if $H=O_p(N_G(H))$.
DeclareGlobalFunction("RadicalpSubgroups");

#! @BeginGroup
#! @Description The poset of radical $p$-subgroups of a finite group <A>G</A>, also known as the Bouc poset.
#! @Arguments G,p
DeclareOperation("PosetOfRadicalpSubgroups", [IsGroup and IsFinite,IsInt]);
#! @Arguments G,p
DeclareOperation("BoucPoset", [IsGroup and IsFinite,IsInt]);
#! @EndGroup


#! @Description The points of the Robinson poset $R_p(G)$ are the chains $(H_1 &gt; H_2 &gt; \ldots  &gt; H_k)$ of $p$-subgroups such that for every $i$, $H_i \triangleleft H_1$. The ordering is given by inclusion.
#! @Arguments G,p
DeclareOperation("RobinsonPoset", [IsGroup and IsFinite,IsInt]);


#! @Arguments G,p
DeclareOperation("OrbitSubdivisionPosetOfRadicalpSubgroups", [IsGroup and IsFinite,IsInt]);

#! @Arguments G,p
DeclareOperation("OrbitSubdivisionPosetOfElementaryAbelianpSubgroups", [IsGroup and IsFinite,IsInt]);

#! @Arguments G,p
DeclareOperation("OrbitSubdivisionPosetOfpSubgroups", [IsGroup and IsFinite,IsInt]);


#! @Section Poset of subspaces of a vector space

#! @Arguments V
#! @Description The lattice of subspaces of the finite vector space $V$.
DeclareOperation("PosetOfSubspaces", [IsVectorSpace and IsFinite]);

#! @Arguments V
#! @Description The reduced lattice of proper subspaces of the finite vector space $V$.
DeclareOperation("PosetOfProperSubspaces", [IsVectorSpace and IsFinite]);
