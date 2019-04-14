#############################################################################
##
#W  constructions.gd             Posets Package
##
##
##  
##  
##
DeclareOperation("NaturalMaps",[IsPoset]);

DeclareOperation("SourceMap",[IsPosetHomomorphism]);
DeclareOperation("TargetMap",[IsPosetHomomorphism]);
DeclareOperation("ImageMap",[IsPosetHomomorphism]);
DeclareOperation("ImageMap",[IsPosetHomomorphism,IsObject]);

DeclareOperation("SubPoset",[IsPoset,IsList]);
DeclareOperation("CoproductPosets",[IsList]);
DeclareOperation("JoinPosets",[IsList]);
DeclareOperation("ProductPosets",[IsList]);
DeclareOperation("ConePoset",[IsPoset]);
DeclareOperation("SuspensionPoset",[IsPoset]);
DeclareOperation("OppositePoset",[IsPoset]);


DeclareOperation("MappingCylinderPosetHomomorphism",[IsPosetHomomorphism]);
DeclareOperation("QuotientOfPosetBySubposet",[IsPoset,IsList]); # to do [Section 2.7, Barmak]
DeclareOperation("WedgePosets",[IsList]); # to do

