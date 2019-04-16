# More properties

# we do not check source(f)=target(f)! In this way we can consider FixedPoints of an inclusion i:A-->X
InstallMethod(FixedPointsPosetHomomorphism,
"for PosetHomomorphism",
[IsPosetHomomorphism],
function(f)
	local X,Fixf;
	X:=SourceMap(f);
	Fixf := Filtered(Set(X), x-> x=ImageMap(f,x));
	return SubPoset(X,Fixf);
end);



InstallMethod(HasFixedPointProperty,
"for Poset",
[IsPoset],
function(X)
	local homXX;
	homXX:=Set(HomPosets(X,X));
	return ForAll( homXX, f -> Size(FixedPointsPosetHomomorphism(f)) > 0 );
end);
