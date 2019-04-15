# posets of subgroups of a finite group Ap(G) Sp(G), etc.

#! @Chapter Posets of subgroups of a finite group



#! @Section Posets of p-subgroups

#!
DeclareOperation("PosetOfSubgroups", [IsGroup and IsFinite]);

#!
DeclareOperation("PosetOfpSubgroups", [IsGroup and IsFinite,IsInt]);
#!
DeclareOperation("PosetOfElementaryAbelianpSubgroups", [IsGroup and IsFinite,IsInt]);
#!
DeclareGlobalFunction("RadicalpSubgroups");
#!
DeclareOperation("PosetOfRadicalpSubgroups", [IsGroup and IsFinite,IsInt]);
