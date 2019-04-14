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

DeclareOperation("SubPoset",[IsPoset,IsList]);
DeclareOperation("CoproductPosets",[IsList]);
DeclareOperation("JoinPosets",[IsList]);
DeclareOperation("ProductPosets",[IsList]);
