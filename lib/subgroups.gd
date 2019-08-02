#! @Chapter Posets of subgroups of a finite group

#! @Section Posets of subgroups

#! @Arguments G
DeclareOperation("PosetOfSubgroups", [IsGroup and IsFinite]);

#! @Arguments G,p
DeclareOperation("PosetOfpSubgroups", [IsGroup and IsFinite,IsInt]);

#! @Arguments G,p
DeclareGlobalFunction("ElementaryAbelianpSubgroups");

#! @Arguments G,p
DeclareOperation("PosetOfElementaryAbelianpSubgroups", [IsGroup and IsFinite,IsInt]);

#! @Arguments G,p
DeclareGlobalFunction("RadicalpSubgroups");

#! @Arguments G,p
DeclareOperation("PosetOfRadicalpSubgroups", [IsGroup and IsFinite,IsInt]);

#! @Arguments G,p
DeclareOperation("RobinsonFacePosetOfpSubgroups", [IsGroup and IsFinite,IsInt]);


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
