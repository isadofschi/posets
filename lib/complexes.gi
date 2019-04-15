################################################################################
# FacePoset and OrderComplex
# (we still need to implement these on morphisms)

InstallMethod(FacePoset,
"for SimplicialComplex",
[IsHapSimplicialComplex],
function(K)
	local n,simplicesK;
	n:=Dimension(K);
	simplicesK:=Set(Concatenation(List([0..n], d->List([1..(K!.nrSimplices(d))], j-> K!.simplices(d,j)))));
	return PosetByFunctionNC(simplicesK, IsSubset);
end);

InstallMethod(OrderComplex,
"for Poset",
[IsPoset],
function(X)
	local n,i,j,chains,position,chain;
	n:=Size(X);
	# this part could be a separate function computing the representation of the poset given by the U^_x s
	X!.UHats:=List([1..n],x->[]);
	for i in [1..n] do
		for j in [1..n] do
			if i<>j and Ordering(X)(Set(X)[i],Set(X)[j]) then
				Add(X!.UHats[i],j);
			fi;
		od;
	od;
	#
	chains:=[];
	for i in [1..n] do
		Add(chains,[i]);
	od;
	position:=1;
	while position <= Length(chains) do
		chain:=chains[position];
		i:=chain[Length(chain)];
		for j in X!.UHats[i] do
			Add(chains, Concatenation(chain,[j]) );
		od;
		position:=position+1;
	od;
	return SimplicialComplex(chains); # here we forget the names of the points :(
end);

################################################################################
# Homology of a poset or order preserving morphism
InstallMethod(PosetHomology,
"for Poset",
[IsPoset],
function(X)
	return Homology(OrderComplex(X));
end);


InstallOtherMethod(EulerCharacteristic,
"for Poset",
[IsPoset],
function(X)
	return EulerCharacteristic(OrderComplex(X));
end);

InstallMethod(FundamentalGroup,
"for Poset",
[IsPoset],
function(X)
	return FundamentalGroup(OrderComplex(X));
end);

