################################################################################
# FacePoset and OrderComplex
# (we still need to implement these on morphisms)

InstallMethod(FacePoset,
"for SimplicialComplex",
[SCIsSimplicialComplex],
function(K)
	local n,simplicesK,num_simplices,M,iter,i,j,tau;
	n:=SCDim(K);
	simplicesK:=Set(Concatenation(List([1..n+1], i->K[i])));
	num_simplices:=Length(simplicesK);
	M:=List([1..num_simplices], s-> List([1..num_simplices], t->false));
	for i in [1..num_simplices] do
		iter:=IteratorOfCombinations(simplicesK[i]);
		for tau in iter do
			if Size(tau)>0 then
				j:=PositionSorted(simplicesK,tau);
				M[i][j]:=true;
			fi;
		od;
	od;
	return PosetByOrderMatrix(M,simplicesK); # unnecesary checks here should use an NC version.
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
	return SC(chains); # here we forget the names of the points :(
end);

################################################################################
# Homology of a poset or order preserving morphism
InstallMethod(PosetHomology,
"for Poset",
[IsPoset],
function(X)
	return SCHomology(OrderComplex(X));
end);


InstallMethod(EulerCharacteristic,
"for Poset",
[IsPoset],
function(X)
	return SCEulerCharacteristic(OrderComplex(X));
end);

InstallMethod(FundamentalGroup,
"for Poset",
[IsPoset],
function(X)
	return SCFundamentalGroup(OrderComplex(X));
end);

