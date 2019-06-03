# posets of subgroups of a finite group Ap(G) Sp(G), etc.

#! @Chapter Posets of subgroups of a finite group



#! @Section Posets of p-subgroups

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
DeclareOperation("OrbitSubdivisionPosetOfRadicalpSubgroups", [IsGroup and IsFinite,IsInt]);
#!
DeclareOperation("OrbitSubdivisionPosetOfElementaryAbelianpSubgroups", [IsGroup and IsFinite,IsInt]);
#!
DeclareOperation("OrbitSubdivisionPosetOfpSubgroups", [IsGroup and IsFinite,IsInt]);