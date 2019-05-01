################################################################################
# FacePoset and OrderComplex

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
	# we could use the hasse diagram to construct K(X) using only the maximal chains

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

	chains:=[];
	for i in [1..n] do
		Add(chains,[Set(X)[i]]);
	od;
	position:=1;
	while position <= Length(chains) do
		chain:=chains[position];
		i:=PositionSorted(Set(X),chain[Length(chain)]);
		for j in X!.UHats[i] do
			Add(chains, Concatenation(chain,[Set(X)[j]]) );
		od;
		position:=position+1;
	od;
	return SimplicialComplex(chains);
end);


InstallMethod(FacePoset,
"for SimplicialMap",
[IsHapSimplicialMap],
function(f)
	return PosetHomomorphismByFunction(FacePoset(f!.source),FacePoset(f!.target),sigma -> List(sigma, f!.mapping) );
end);

InstallMethod(OrderComplex,
"for PosetHomomorphism",
[IsPosetHomomorphism],
function(f)
	return SimplicialMap(OrderComplex(f!.source),OrderComplex(f!.target), f!.f );
end);

################################################################################

InstallMethod(BarycentricSubdivision,
"for SimplicialComplex",
[IsHapSimplicialComplex],
function(K)
	return OrderComplex(FacePoset(K));
end);

InstallMethod(BarycentricSubdivision,
"for Poset",
[IsPoset],
function(X)
	local X1,m,max;
	max:=function(x,y)
		if Ordering(X)(x,y) then
			return x;
		else
			if Ordering(X)(y,x) then
				return y;
			else
				return fail;
			fi;
		fi;
	end;
	X1:=FacePoset(OrderComplex(X));
	m:=PosetHomomorphismByImages(X1,X, List(Set(X1), c->Iterated(c,max)) );
	X1!.naturalMaps:=[m];
	return X1;
end);

InstallMethod(BarycentricSubdivision,
"for SimplicialMap",
[IsHapSimplicialMap],
function(f)
	return OrderComplex(FacePoset(f));
end);

InstallMethod(BarycentricSubdivision,
"for PosetHomomorphism",
[IsPosetHomomorphism],
function(f)
	return FacePoset(OrderComplex(f));
end);

################################################################################

# Homology of a poset or order preserving morphism
InstallMethod(PosetHomology,
"for Poset",
[IsPoset],
function(X)
	return Homology(OrderComplex(X));
end);
InstallMethod(PosetHomology,
"for Poset",
[IsPoset,IsInt],
function(X,n)
	return Homology(OrderComplex(X),n);
end);
InstallMethod(PosetHomology,
"for PosetHomomorphism, integer",
[IsPosetHomomorphism,IsInt],
function(f,n)
	return Homology( ChainMapOfSimplicialMap(OrderComplex(f)), n);
end);

################################################################################


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

