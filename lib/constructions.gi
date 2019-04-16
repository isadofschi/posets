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
	return SubPoset(TargetMap(f), Set(List(Set(f!.source),f!.f)) );
end);

InstallMethod(ImageMap,
"for Poset homomorphism, element",
[IsPosetHomomorphism,IsObject],
function(f,x)
	local X;
	X:=Set(SourceMap(f));
	if not x in X then
		Error("x is not an element of the domain of f");
	fi;
	return f!.f(x);
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
	local sizes,m,pos,list_names_original,list_names_coprod,coprodXs,ordering;
	if not ForAll(Xs, X->IsPoset(X) ) then
		Error("arguments must be posets");
	fi;
	sizes:=List(Xs,Size);
	m:=Length(Xs);
	list_names_original:=List(Xs,Set);
	list_names_coprod := List([1..m], i -> List(list_names_original[i], x-> [i,x]));
	ordering:=function(x,y)
		return x[1]=y[1] and Ordering(Xs[x[1]])(x[2],y[2]);
	end;
	coprodXs:=PosetByFunctionNC(Concatenation(list_names_coprod), ordering);
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


InstallMethod(ProductPosets,
"for List",
[IsList],
function(Xs)
	local m,list_names_original,names_prod,prodXs,ordering;
	if not ForAll(Xs, X->IsPoset(X) ) then
		Error("arguments must be posets");
	fi;
	m:=Length(Xs);
	
	list_names_original:=List(Xs,Set);
	names_prod := Cartesian(list_names_original);

	ordering:=function(x,y)
		return ForAll([1..m], i-> Ordering(Xs[i])(x[i],y[i]) );
	end;
	prodXs:=PosetByFunctionNC(names_prod,ordering);
	prodXs!.naturalMaps:=List([1..m], i->PosetHomomorphismByImages(prodXs,Xs[i],List(names_prod, x->x[i])));
	return prodXs;
end);

InstallMethod(ConePoset,
"for Poset",
[IsPoset],
function(X)
	local x;
	x:=PosetByFunctionNC( ["x"], \= ); # poset of size 1
	return JoinPosets([X,x]);
end);

InstallMethod(SuspensionPoset,
"for Poset",
[IsPoset],
function(X)
	local Sigma0;
	Sigma0:=PosetByFunctionNC( ["x","y"], \= );
	return JoinPosets([X,Sigma0]);
end);


InstallMethod(OppositePoset,
"for Poset",
[IsPoset],
function(X)
	return PosetByFunctionNC(Set(X), function(x1,x2) return Ordering(X)(x2,x1); end);
end);


# Returns Zf. The NaturalMaps are  i:X-->Zf, j:Y-->Zf and r:Zf-->Y
InstallMethod(MappingCylinderPosetHomomorphism,
"for Poset homomorphism",
[IsPosetHomomorphism],
function(f)
	local X,Y,Zf,namesZf,ordering;
	X:=SourceMap(f);
	Y:=TargetMap(f);
	namesZf:=Concatenation(List(Set(X), x->[1,x]), List(Set(Y), y->[2,y]));
	ordering:=function(p,q)
		if p[1]=1 then
			if q[1]=1 then
				return Ordering(X)(p[2],q[2]);
			else
				return false;
			fi;
		else
			if q[1]=2 then
				return Ordering(Y)(p[2],q[2]);
			else
				return Ordering(Y)(p[2],ImageMap(f,q[2]));
			fi;
		fi;
	end;
	Zf:=PosetByFunctionNC(namesZf,ordering);
	Zf!.naturalMaps:= [ PosetHomomorphismByImages(X,Zf,List(Set(X), x->[1,x])), # i 
						PosetHomomorphismByImages(Y,Zf,List(Set(Y), y->[1,y])), # j
						PosetHomomorphismByImages(Zf,Y,Concatenation(f!.images,Set(Y))) # r
					  ];
	return Zf;
end);

# Note that, for f,g in HomPosets(X,Y),  Ordering(HomPosets(X,Y))(f,g) is NOT the same as f<g
InstallMethod(HomPosets,
"for Poset and Poset",
[IsPoset,IsPoset],
function(X,Y)
	local ts,homXY,t,f,ordering;
	ts:=IteratorOfTuples(Set(Y),Size(X));
	homXY:=[];
	for t in ts do
		f:=PosetHomomorphismByImages(X,Y,t);
		if not f=fail then
			Add(homXY,f);
		fi;
	od;
	ordering:=function(f1,f2)
		return ForAll(Set(X),x-> Ordering(Y)(f1!.f(x),f2!.f(x)));
	end;
	return PosetByFunctionNC(Set(homXY),ordering);
end);


