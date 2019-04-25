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

InstallMethod(Grading,
"for Poset",
[IsPoset],
function(X)
	local heights,grading,c;
	heights := List(Set(X),x-> Dimension(OrderComplex(ElementsBelow(X,x))));
	grading := x -> heights[PositionSorted(Set(X),x)];
	for c in CoveringRelations(X) do
		if grading(c[1]) <> grading(c[2])+1 then
			return fail;
		fi;
	od;
	return grading;
end);
