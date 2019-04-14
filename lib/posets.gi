#############################################################################
##
#W  posets.gi             posets Package
##
##
##  
##  
##

LoadPackage("SimpComp");

PosetFamily:=NewFamily("PosetFamily",IsPoset);;
PosetType:=NewType(PosetFamily,  IsPoset );;

PosetHomomorphismFamily:=NewFamily("PosetHomomorphismFamily",IsPosetHomomorphism);;
PosetHomomorphismType:=NewType(PosetHomomorphismFamily,  IsPosetHomomorphism );;


################################################################################

PosetsIntFunc.NewPoset := function() return Objectify( PosetType, rec() ); end ;;

################################################################################

# Methods to print posets and morphisms
InstallMethod(ViewObj,"for Poset",
[IsPoset],
function(X)
	Print("<finite poset of size ", X!.size ,">");
end);

InstallMethod(ViewObj,"for PosetHomomorphism",
[IsPosetHomomorphism],
function(X)
	Print("<order preserving map>");
end);

################################################################################
# Basic functions to build posets and morphisms

InstallMethod(PosetByOrderMatrix,
"for List",
[IsList],
function(M)
	return PosetByOrderMatrix(M,[]);
end);

InstallMethod(PosetByOrderMatrix,
"for List, List",
[IsList,IsList],
function(M,names)
	local poset,n,M1,i,j,sigma;

	n:=Length(M);
	
	sigma:=Sortex(names)^-1;
	names:=Set(names);

	if names=[] then
		names:=[1..n];
	fi;
	if Length(names)<>n then
		Error("names must have "+String(n)+" elements");
	fi;
	if not ForAll(M, v->Length(v)=n) then
		Error("M is not a square matrix");
	fi;
	if ForAll(Concatenation(M), IsInt ) then
		M:=List(M,v->List(v,x -> x<>0));
	fi; 
	if not ForAll(Concatenation(M), x->x in [true,false] ) then
		Error("Every element of M must be true or false");
	fi;
	if not ForAll([1..n], i->M[i][i]) then
		Error("The relation is not reflexive");
	fi;
	if not ForAll([1..n],i-> ForAll( [1..n], j->  not (M[i][j] and M[j][i]) or i=j )) then
		Error("The relation is not antisymmetric");
	fi;
	if not ForAll([1..n],i-> ForAll( [1..n], j-> ForAll([1..n],k -> (not (M[i][j] and M[j][k])) or M[i][k] ))) then
		Error("The relation is not transitive");
	fi;

	M1 := StructuralCopy(M); # we first reorder the rows and columns using sigma
	for i in [1..n] do
		for j in [1..n] do
			M1[i][j]:=M[i^sigma][j^sigma];
		od;
	od;

	poset := PosetsIntFunc.NewPoset();
	poset!.orderMatrix:=M1;
	poset!.size:=n;
	poset!.names:=names;

	return poset;

end);

InstallMethod(PosetHomomorphismByImages,
"for Poset, Poset and List",
[IsPoset, IsPoset, IsList],
function(X,Y,ims)
	local m,n;
	n:=X!.size;
	m:=Y!.size;
	if not Length(ims)=n and ForAll(ims, y->y in [1..m] ) then
		Error("invalid arguments");
	fi;
	# the following computation could be done faster if we already know the hasse diagram of X
	if not ForAll([1..n],i->ForAll([1..n],j-> (not X!.orderMatrix[i][j]) or Y!.orderMatrix[ims[i]][ims[j]] )) then
		Error("the map is not order preserving");
	fi;
	return Objectify( PosetHomomorphismType, rec(source:=X, target:=Y, images:=ims) );
end);

#InstallMethod(IdentityMapping,
#"for Poset",
#[IsPoset],
#function(X)
#	return Objectify( PosetHomomorphismType, rec(source:=X, target:=X, images:=[1..(X!.size)]) );
#end);




## Turns a poset into an order relation
InstallMethod(RelationByPoset,
"for Poset",
[IsPoset],
function(X)
	local n;
	n:=X!.size;
	return PartialOrderByOrderingFunction( Domain(X!.names), function(i,j) return X!.orderMatrix[PositionSorted(X!.names,i)][PositionSorted(X!.names,j)]; end );
end);

# turns a relation into a poset
InstallMethod(PosetByOrderRelation,
"for PartialOrderBinaryRelation",
[IsPartialOrderBinaryRelation],
function(R)
	local M,n,names,U,i,y;
	n:=Size(Source(R));
	names:=Set(Source(R));
	M:=List([1..n],x->List([1..n],x->false));
	for i in [1..n] do
		U:=Images(R,names[i]);
		for y in U do
			M[i][Position(names,y)]:=true;
		od;
	od;
	return PosetFromOrderMatrix(M,names); # estamos chequeando cosas innecesariamente, por ejemplo transitividad
		
end);



InstallMethod(HasseDiagram,
"for Poset",
[IsPoset],
function(X)
	local R,h;
	R:=RelationByPoset(X);
	h:=HasseDiagramBinaryRelation(R);
	X!.HasseDiagramNames:=List(Set(Source(h)), x->Images(h,x));
	X!.HasseDiagramNumbers:= List(X!.HasseDiagramNames, x-> List(x, y-> PositionSorted(X!.names,y)));
end);




################################################################################
# FacePoset and OrderComplex
# (we still need to implement these on morphisms)

InstallMethod(FacePoset,
"for SimplicialComplex",
[SCIsSimplicialComplex],
function(K)
	local n,simplicesK,num_simplices,M,iter,i,j,tau;
	n:=SCDim(K);
	simplicesK:=Set(Concatenation(List([1..n+1], i->K[i]))); # we have to decide if we want to sort this list
	num_simplices:=Length(simplicesK);
	M:=List([1..num_simplices], s-> List([1..num_simplices], t->false));
	for i in [1..num_simplices] do
		iter:=IteratorOfCombinations(simplicesK[i]);
		for tau in iter do
			if Size(tau)>0 then
				j:=PositionSorted(simplicesK,tau); # Position or PositionSorted, depending on the previous decision
				M[i][j]:=true;
			fi;
		od;
	od;
	return Objectify( PosetType, rec(orderMatrix:=M, size:=num_simplices,names:=simplicesK) );
end);

InstallMethod(OrderComplex,
"for Poset",
[IsPoset],
function(X)
	local n,i,j,chains,position,chain;
	n:=X!.size;
	# this part could be a separate function computing the representation of the poset given by the U^_x s
	X!.UHats:=List([1..n],x->[]);
	for i in [1..n] do
		for j in [1..n] do
			if i<>j and X!.orderMatrix[i][j] then
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
	return SC(chains);
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


