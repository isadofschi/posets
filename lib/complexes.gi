################################################################################
# FacePoset and OrderComplex

InstallMethod(FacePoset,
"for SimplicialComplex",
[IsHapSimplicialComplex],
function(K)
	local n,simplicesK;
	n:=Dimension(K);
	simplicesK:=Set(Concatenation(List([0..n], d->List([1..(K!.nrSimplices(d))], j-> K!.simplices(d,j)))));
	XK:=PosetByFunctionNC(simplicesK, IsSubset);
	SetGrading(XK, s->Size(s)-1);
	return XK; 
end);


InstallMethod(OrderComplex,
"for Poset",
[IsPoset],
function(X)
	return SimplicialComplex(ChainsPoset(X));
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

