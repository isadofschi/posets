#############################################################################
##  
##  PackageInfo.g for the package `Posets'             
##														Ximena Fernandez  												   
##														Kevin Piterman
## 														Iván Sadofschi Costa
##
##

SetPackageInfo( rec(

PackageName := "Posets",

Subtitle := "Posets and finite spaces.",


Version := "1.0.1",
Date := "10/04/2019",

PackageWWWHome :=
  Concatenation( "https://github.com/isadofschi/", LowercaseString( ~.PackageName ) ),

SourceRepository := rec(
    Type := "git",
    URL := Concatenation( "https://github.com/isadofschi/", LowercaseString( ~.PackageName ) ),
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
SupportEmail := "isadofschi@dm.uba.ar",

ArchiveURL := Concatenation( ~.SourceRepository.URL,
                                 "/releases/download/v", ~.Version,
                                 "/", ~.PackageName, "-", ~.Version ),


ArchiveFormats := ".tar.gz",


Persons := [
   rec( 
    LastName      := "Fernández",
    FirstNames    := "Ximena",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "xfernand@dm.uba.ar",
    WWWHome       := "http://mate.dm.uba.ar/~xfernand",
    PostalAddress := Concatenation( [
                       "Pabellón I - Ciudad Universitaria (1428)\n",
                       "Buenos Aires\n",
                       "Argentina" ] ),
    Place         := "Buenos Aires",
    Institution   := "University of Buenos Aires"
  ),

  rec( 
    LastName      := "Piterman",
    FirstNames    := "Kevin",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "kpiterman@dm.uba.ar",
    WWWHome       := "http://mate.dm.uba.ar/~kpiterman",
    PostalAddress := Concatenation( [
                       "Pabellón I - Ciudad Universitaria (1428)\n",
                       "Buenos Aires\n",
                       "Argentina" ] ),
    Place         := "Buenos Aires",
    Institution   := "University of Buenos Aires"
  ),
 rec( 
    LastName      := "Sadofschi Costa",
    FirstNames    := "Iván",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "isadofschi@dm.uba.ar",
    WWWHome       := "http://mate.dm.uba.ar/~isadofschi",
    PostalAddress := Concatenation( [
                       "Pabellón I - Ciudad Universitaria (1428)\n",
                       "Buenos Aires\n",
                       "Argentina" ] ),
    Place         := "Buenos Aires",
    Institution   := "University of Buenos Aires"
  ),

 
],

Status := "dev",

README_URL := 
  Concatenation( ~.PackageWWWHome, "/README.md" ),

PackageInfoURL := 
  Concatenation( ~.PackageWWWHome, "/PackageInfo.g" ),

AbstractHTML := 
  "Posets and finite spaces.",


PackageDoc := rec(
  BookName  := ~.PackageName,
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := ~.Subtitle,
),


Dependencies := rec(
  GAP := "4.8.2",

  NeededOtherPackages := [ ["HAP", ">=1.11.13"], ["SONATA", ">=2.8"], ["RDS",">=1.6"], ["Digraphs",">=0.15.0"] ],


  SuggestedOtherPackages := [],


  ExternalConditions := []),


AvailabilityTest := ReturnTrue,

BannerString := Concatenation( 
    "─────────────────────────────────────────────────────────────────────────────\n",
    "Loading  Posets - ", ~.Version, "\n",
    "Posets and finite spaces \n",
    "by ",
    JoinStringsWithSeparator( List( Filtered( ~.Persons, r -> r.IsAuthor ),
                                    r -> Concatenation(
        r.FirstNames, " ", r.LastName, " (", r.WWWHome, ")\n" ) ), "   " ),
    "For help, type: ?Posets \n",
    "─────────────────────────────────────────────────────────────────────────────\n" ),

TestFile := "tst/testall.g",

Autoload := false,

Keywords := ["posets", "finite spaces" ]

));

