#############################################################################
##
#W  constructions.gd             Posets Package
##
##
##  
##  
##

#! @Chapter Constructing new posets

#! @Section Natural maps

#! @Arguments X
#! @Returns the natural maps of the poset X.
#! @Description for example NaturalMaps of a product gives the projections.
DeclareOperation("NaturalMaps",[IsPoset]);

#! @Section Some methods for poset homomorphisms

#!
DeclareOperation("SourceMap",[IsPosetHomomorphism]);
#!
DeclareOperation("TargetMap",[IsPosetHomomorphism]);
#!
DeclareOperation("UnderlyingMap",[IsPosetHomomorphism]);
#!
DeclareAttribute("InverseImmutable",IsPosetHomomorphism);
#!
DeclareOperation("ImageMap",[IsPosetHomomorphism]);
#!
DeclareOperation("ImageMap",[IsPosetHomomorphism,IsObject]);
#!
DeclareOperation("\^",[IsObject,IsPosetHomomorphism]);


#! @Section Categorical constructions
# Documentar tambien DirectProduct. Documentar DirectProduct y Coproduct para morfismos

#!
DeclareOperation("SubPoset",[IsPoset,IsList]);


DeclareOperation("CoproductOp",[IsList,IsPoset]);
#!
DeclareGlobalFunction("Coproduct");


DeclareOperation("JoinOp",[IsList,IsPoset]);
#!
DeclareGlobalFunction("Join");


#!
DeclareOperation("ConePoset",[IsPoset]);
#!
DeclareOperation("SuspensionPoset",[IsPoset]);
#!
DeclareOperation("OppositePoset",[IsPoset]);

#!
DeclareOperation("MappingCylinderPosetHomomorphism",[IsPosetHomomorphism]);
#!
DeclareOperation("QuotientPoset",[IsPoset,IsList]); # [Section 2.7, Barmak]
#!
DeclareOperation("WedgePosets",[IsList]);

#!
DeclareOperation("HomPosets",[IsPoset,IsPoset]);

#!
DeclareAttribute("Endomorphisms",IsPoset);

#!
DeclareAttribute("AutomorphismGroup",IsPoset);
#!
DeclareAttribute("Automorphisms",IsPoset);

