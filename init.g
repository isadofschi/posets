#############################################################################
##
#W    init.g	  The posets package		 
#W
##


DeclareGlobalVariable("PosetsIntFunc"); #internal functions
InstallValue(PosetsIntFunc,rec());
MakeReadWriteGlobal("PosetsIntFunc");


#############################################################################
##
#R  Read the declaration files.
##

ReadPackage( "Posets", "lib/posets.gd" );
ReadPackage( "Posets", "lib/constructions.gd" );
ReadPackage( "Posets", "lib/subgroups.gd" );

#E  init.g . . . . . . . . . . . . . . . . . . . . . . . . . . . .  ends here

