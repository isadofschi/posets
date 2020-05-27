SetInfoLevel(InfoPackageLoading,4);
LoadPackage( "posets" );

TestDirectory( DirectoriesPackageLibrary("posets","tst/tests"),
			   rec(exitGAP := true, testOptions := rec(compareFunction := "uptowhitespace") )

 );

FORCE_QUIT_GAP(1); # if we ever get here, there was an error
