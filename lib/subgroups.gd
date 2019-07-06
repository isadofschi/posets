# posets of subgroups of a finite group Ap(G) Sp(G), etc.

#! @Chapter Posets of subgroups of a finite group



#! @Section Posets of subgroups

#!
DeclareOperation("PosetOfSubgroups", [IsGroup and IsFinite]);

#!
DeclareOperation("PosetOfpSubgroups", [IsGroup and IsFinite,IsInt]);
#!
DeclareGlobalFunction("ElementaryAbelianpSubgroups");
#!
DeclareOperation("PosetOfElementaryAbelianpSubgroups", [IsGroup and IsFinite,IsInt]);
#!
DeclareGlobalFunction("RadicalpSubgroups");
#!
DeclareOperation("PosetOfRadicalpSubgroups", [IsGroup and IsFinite,IsInt]);
#!
DeclareOperation("RobinsonFacePosetOfpSubgroups", [IsGroup and IsFinite,IsInt]);


#!
DeclareOperation("OrbitSubdivisionPosetOfRadicalpSubgroups", [IsGroup and IsFinite,IsInt]);
#!
DeclareOperation("OrbitSubdivisionPosetOfElementaryAbelianpSubgroups", [IsGroup and IsFinite,IsInt]);
#!
DeclareOperation("OrbitSubdivisionPosetOfpSubgroups", [IsGroup and IsFinite,IsInt]);


#! @Section Poset of subspaces of a vector space

#!
DeclareOperation("PosetOfSubspaces", [IsVectorSpace and IsFinite]);
#!
DeclareOperation("PosetOfProperSubspaces", [IsVectorSpace and IsFinite]);
