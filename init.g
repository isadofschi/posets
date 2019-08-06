#############################################################################
##
#W    init.g	  The posets package		 
#W
##


#DeclareGlobalVariable("PosetsIntFunc"); #internal functions
#InstallValue(PosetsIntFunc,rec());
#MakeReadWriteGlobal("PosetsIntFunc");


#############################################################################
##
#R  Read the declaration files.
##

ReadPackage( "Posets", "lib/posets.gd" );
ReadPackage( "Posets", "lib/maps.gd" );
ReadPackage( "Posets", "lib/complexes.gd" );
ReadPackage( "Posets", "lib/constructions.gd" );
ReadPackage( "Posets", "lib/subgroups.gd" );
ReadPackage( "Posets", "lib/namedposets.gd" );
ReadPackage("Posets", "lib/beatweak.gd" );
ReadPackage("Posets", "lib/deformations.gd" );
ReadPackage("Posets", "lib/properties.gd" );
ReadPackage("Posets", "lib/colorings.gd" );
ReadPackage("Posets", "lib/presentations.gd" );
ReadPackage("Posets", "lib/fences.gd" );
ReadPackage("Posets", "lib/plot.gd" );
#E  init.g . . . . . . . . . . . . . . . . . . . . . . . . . . . .  ends here

