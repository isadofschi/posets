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
			return fail; # the poset may be graded and this method returns fail
		fi;
	od;
	return grading;
end);

InstallMethod(Height,
"for Poset and element",
[IsPoset,IsObject],
function(X,x)
	local i,h,y;
	if not x in Set(X) then
		Print("error, x must be a point of X");
		return fail;
	fi;
	if not IsBound(X!.heights) then
		X!.heights:=List([1..Size(X)], x->-1);
	fi;
	i:=PositionSorted(Set(X),x);	
	if X!.heights[i] = -1 then
		h:=0;
		for y in Set(X) do
			if x<>y and Ordering(X)(x,y) then # if x > y (strictly)
				h:=Maximum(h,1+Height(X,y));
			fi;
		od;
		X!.heights[i]:=h;
	fi;
	return X!.heights[i];
end);


InstallMethod(Height,
"for Poset",
[IsPoset],
function(X)
	return Maximum(List(Set(X),x->Height(X,x)));
end);
