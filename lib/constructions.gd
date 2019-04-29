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
DeclareOperation("ImageMap",[IsPosetHomomorphism]);
#!
DeclareOperation("ImageMap",[IsPosetHomomorphism,IsObject]);



#! @Section Categorical constructions

#!
DeclareOperation("SubPoset",[IsPoset,IsList]);
#!
DeclareOperation("CoproductPosets",[IsList]);
#!
DeclareOperation("JoinPosets",[IsList]);
#!
DeclareOperation("ProductPosets",[IsList]);
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
DeclareOperation("WedgePosets",[IsList]); # to do

#!
DeclareOperation("HomPosets",[IsPoset,IsPoset]);
