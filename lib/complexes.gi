################################################################################
# FacePoset and OrderComplex

InstallMethod(FacePoset,
"for SimplicialComplex",
[IsHapSimplicialComplex],
function(K)
	local n,simplicesK,XK;
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
	if Size(X)=0 then
		return SimplicialComplex([[]]);
	fi;
	return SimplicialComplex(ChainsPoset(X));
end);


InstallMethod(FacePoset,
"for SimplicialMap",
[IsHapSimplicialMap],
function(f)
	return PosetHomomorphismByFunction(FacePoset(f!.source),FacePoset(f!.target),sigma -> f!.mapping(sigma) );
end);

InstallMethod(OrderComplex,
"for PosetHomomorphism",
[IsPosetHomomorphism],
function(f)
	return SimplicialMap(OrderComplex(SourceMap(f)),OrderComplex(TargetMap(f)), UnderlyingFunction(f));
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
	#return EulerCharacteristic(OrderComplex(X));
	#local n,X1;
	#n:=Size(X);
	#X1:=ConePoset(OppositePoset(ConePoset(X)));
	#return 1+MobiusFunction(X1)(MinimumPoset(X1),MaximumPoset(X1));
	local d,n,i,number_chains,h,chi,k;
	IndicesElementsBelow(X);
	d:=NewDictionary([],true);
	n:=Size(X);
	for i in [1..n] do
		AddDictionary(d,[i,0],1); # There is only one 0-chain with maximum Set(X)[i]
	od;
	number_chains:=function(i,l)
		# returns the number of l-dimensional chains of X with maximum Set(X)[i]
		local t,j;
		if LookupDictionary(d,[i,l])=fail then
			t:=0;
			for j in IndicesElementsBelow(X)[i] do
				if j<>i then
					t:=t+number_chains(j,l-1);	
				fi;
			od;
			AddDictionary(d,[i,l],t);
		fi;
		return LookupDictionary(d,[i,l]);
	end;;
	h:=Height(X);
	chi:=0;
	for i in [1..n] do
		for k in [0..Height(X,Set(X)[i])] do
			chi:=chi+(-1)^k*number_chains(i,k);
		od;
	od;
	return chi;
end);

InstallMethod(FundamentalGroup,
"for Poset",
[IsPoset],
function(X)
	return FundamentalGroup(OrderComplex(X));
end);

