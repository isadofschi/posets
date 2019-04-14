#############################################################################
##
#W  constructions.gi             Posets Package
##
##
##  
##  
##

InstallMethod(NaturalMaps,
"for Poset",
[IsPoset],
function(X)
	return X!.naturalMaps;
end);

InstallMethod(SourceMap,
"for Poset homomorphism",
[IsPosetHomomorphism],
function(f)
	return f!.source;
end);

InstallMethod(TargetMap,
"for Poset homomorphism",
[IsPosetHomomorphism],
function(f)
	return f!.target;
end);

InstallMethod(ImageMap,
"for Poset homomorphism",
[IsPosetHomomorphism],
function(f)
	return SubPoset(TargetMap(f),Set(f!.images));
end);

InstallMethod(SubPoset,
"for Poset, Set",
[IsPoset, IsList],
function(X,A)
	local Y, numbers,incl;
	if not IsSet(A) then
		Error("A must be a Set");
	fi;
	if not IsSubset(Set(X),A) then
		Error("A must be a subset of X");
	fi;
	numbers:=List(A,x->PositionSorted(Set(X),x));
	Y:=PosetByFunctionNC(A,Ordering(X));
	#Y!.orderMatrix:=OrderMatrix(X){numbers}{numbers};
	incl:=PosetHomomorphismByImages(Y,X,A);
	Y!.naturalMaps:=[incl];
	return Y;
end);

InstallMethod(CoproductPosets,
"for List",
[IsList],
function(Xs)
	local sizes,m,size_coprod,M_coprod,pos,i,j,k,list_names_original,list_names_coprod,coprodXs;
	if not ForAll(Xs, X->IsPoset(X) ) then
		Error("arguments must be posets");
	fi;
	sizes:=List(Xs,Size);
	m:=Length(Xs);
	size_coprod:=Sum(sizes);
	M_coprod:=List([1..size_coprod], x-> List([1..size_coprod],ReturnFalse));
	pos:=0;
	for i in [1..m] do
		for j in [1..sizes[i]] do
			for k in [1..sizes[i]] do
				M_coprod[pos+j][pos+k]:=OrderMatrix(Xs[i])[j][k];
			od;
		od;
		pos:=pos+sizes[i];
	od;
	list_names_original:=List(Xs,Set);
	list_names_coprod := List([1..m], i -> List(list_names_original[i], x-> [i,x]));
	coprodXs:= PosetByOrderMatrix(M_coprod,Concatenation(list_names_coprod));
	coprodXs!.naturalMaps:=List([1..m], i->PosetHomomorphismByImages(Xs[i],coprodXs, list_names_coprod[i]));
	return coprodXs;
end);


InstallMethod(JoinPosets,
"for List",
[IsList],
function(Xs)
	local m,list_names_original,list_names_join,joinXs,ordering;
	if not ForAll(Xs, X->IsPoset(X) ) then
		Error("arguments must be posets");
	fi;
	#sizes:=List(Xs,Size);
	m:=Length(Xs);

	list_names_original:=List(Xs,Set);
	list_names_join := List([1..m], i -> List(list_names_original[i], x-> [i,x]));
	ordering:=function(x,y)
		return x[1]>y[1] or (x[1]=y[1] and Ordering(Xs[x[1]])(x[2],y[2]));
	end;
	joinXs:=PosetByFunctionNC(Concatenation(list_names_join),ordering);
	joinXs!.naturalMaps:=List([1..m], i->PosetHomomorphismByImages(Xs[i], joinXs, list_names_join[i]));
	return joinXs;
end);


