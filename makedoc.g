LoadPackage( "AutoDoc" );
LoadPackage("Posets");
AutoDoc( rec( scaffold := true,
              autodoc  := rec( files := [ "doc/chapters.autodoc" ] )
));
QUIT;

