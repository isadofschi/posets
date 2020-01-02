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
	incl:=PosetHomomorphismByFunctionNC(Y,X,y->y);
	Y!.naturalMaps:=[incl];
	return Y;
end);

##############


InstallOtherMethod(DirectProductOp,
"direct product of  posets",
[IsList, IsPoset],
function(Xs,X)
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

InstallOtherMethod(DirectProductOp,
"direct product of poset homomorphisms",
[IsList, IsPosetHomomorphism],
function(L,f)
	local prod;
	if not ForAll(L, g -> SourceMap(g)=SourceMap(f)) then
		Error("the homomorphisms must have the same source");
	fi;
	prod:=DirectProduct(List(L,TargetMap));
	return  PosetHomomorphismByFunctionNC(SourceMap(f),prod, x-> List(L, g->x^g ));
end);


InstallGlobalFunction(Coproduct, function ( arg... )
    local d, prop;
    if Length( arg ) = 0 then
        Error( "<arg> must be nonempty" );
    elif Length( arg ) = 1 and IsList( arg[1] ) then
        if IsEmpty( arg[1] ) then
            Error( "<arg>[1] must be nonempty" );
        fi;
        arg := arg[1];
    fi;
    d := CoproductOp( arg, arg[1] );
    return d;
end);

InstallOtherMethod(CoproductOp,
"coproduct of  posets",
[IsList, IsPoset],
function(Xs,X)
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



InstallOtherMethod(CoproductOp,
"direct product of poset homomorphisms",
[IsList, IsPosetHomomorphism],
function(L,f)
	local coprod;
	if not ForAll(L, g->IsPosetHomomorphism(g) ) then
		Error("arguments must be poset homomorphisms");
	fi;
	if not ForAll(L, g -> TargetMap(g)=TargetMap(f)) then
		Error("the homomorphisms must have the same target");
	fi;
	coprod:=Coproduct(List(L,SourceMap));
	return  PosetHomomorphismByFunctionNC(coprod,TargetMap(f), x-> x[2]^L[x[1]]);
end);

InstallGlobalFunction(Join, function ( arg... )
    local d, prop;
    if Length( arg ) = 0 then
        Error( "<arg> must be nonempty" );
    elif Length( arg ) = 1 and IsList( arg[1] ) then
        if IsEmpty( arg[1] ) then
            Error( "<arg>[1] must be nonempty" );
        fi;
        arg := arg[1];
    fi;
    d := JoinOp( arg, arg[1] );
    return d;
end);

InstallOtherMethod(JoinOp,
"join of  posets",
[IsList, IsPoset],
function(Xs,X)
	local m,list_names_original,list_names_join,joinXs,ordering;
	if not ForAll(Xs, X->IsPoset(X) ) then
		Error("Arguments must be posets.\n");
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

#######


InstallMethod(ConePoset,
"for Poset",
[IsPoset],
function(X)
	local x;
	x:=PosetByFunctionNC( ["x"], \= ); # poset of size 1
	return Join([X,x]);
end);

InstallMethod(SuspensionPoset,
"for Poset",
[IsPoset],
function(X)
	local Sigma0;
	Sigma0:=PosetByFunctionNC( ["x","y"], \= );
	return Join([X,Sigma0]);
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
						PosetHomomorphismByImages(Zf,Y,Concatenation(List(Set(X), x->x^f),Set(Y))) # r
					  ];
	return Zf;
end);

# Note that, for f,g in HomPosets(X,Y),  Ordering(HomPosets(X,Y))(f,g) is NOT the same as f<g
# Has a natural map Y-> HomPosets(X,Y) which sends y to the constant map x->y.
InstallMethod(HomPosets,
"for Poset and Poset",
[IsPoset,IsPoset],
function(X,Y)
	local ts,homXY,t,f,ordering,P;
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
	P:=PosetByFunctionNC(Set(homXY),ordering);
	P!.naturalMaps:=[PosetHomomorphismByFunction(Y,P, y->PosetHomomorphismByFunction(X,Y, x->y ) )];
	return P;
end);

InstallMethod(Endomorphisms,
"for Poset",
[IsPoset],
function(X)
	return HomPosets(X,X);
end);


InstallMethod(QuotientPoset,
"for Poset and List",
[IsPoset,IsList],
function(X,A)
	local M,X_minus_A,names_quotient,q,n,m,M_quotient,i,j,xi,xj,index_qxi,index_qxj,XmodA,UA,FA;
	# Codigo viejo de Ivan
	#if not IsSet(A) then
	#	Print("The subposet A must be a set.\n");
	#	return fail;
	#fi;
	# Reemplazo con mi código para que anden los ejemplos, después vemos
	if not IsList(A) or not IsSubset(Set(X), Set(A)) then
		Print("The second parameter must be a list of elements of the first parameter.\n");
		return fail;
	fi;
	M:=OrderMatrix(X);
	UA:=Union(List(A, x->Set(ElementsBelow(X,x))));
	FA:=Union(List(A, x->Set(ElementsAbove(X,x))));
	if not A = Intersection( UA,FA ) then
		Print("The second parameter must be convex.\n");
		return fail;
	fi;
	X_minus_A:=Difference(Set(X),A);
	names_quotient:=Union( List(X_minus_A, x->[1,x]), [ [ 2, A ] ] );
	q := function(x)
		if x in A then
			return [2,A];
		else
			return [1,x];
		fi;
	end;
	n:=Size(X);
	m:=Size(X)-Size(A)+1;
	M_quotient:=List([1..m], x-> List([1..m],ReturnFalse));
	for i in [1..n] do
		for j in [1..n] do
			xi:=Set(X)[i];
			xj:=Set(X)[j];
			index_qxi:=PositionSorted(names_quotient,q(xi));
			index_qxj:=PositionSorted(names_quotient,q(xj));
			M_quotient[index_qxi][index_qxj] := M_quotient[index_qxi][index_qxj] or M[i][j];
			if (xi in FA) and (xj in UA) then
				M_quotient[index_qxi][index_qxj]:=true;
			fi;
		od;
	od;
	XmodA:=PosetByOrderMatrixNC(names_quotient,M_quotient);
	XmodA!.naturalMaps:=[ PosetHomomorphismByFunction(X,XmodA,q) ];
	return XmodA;
end);

InstallMethod(WedgePosets,
"for List",
[IsList],
function(l)
	local coprod_Xi,basepoints,wedge_Xi,q;
	if not ForAll(l, t-> Size(t)=2 and IsPoset(t[1]) and t[2] in Set(t[1]) ) then
		Print("Invalid arguments.\n");
		return fail;
	fi;
	coprod_Xi:=Coproduct(List(l, t->t[1]));
	basepoints:=List( [1..Size(l)], i-> ImageMap(NaturalMaps(coprod_Xi)[i], l[i][2]) );
	wedge_Xi:=QuotientPoset(coprod_Xi, basepoints);
	q:=NaturalMaps(wedge_Xi)[1];
	wedge_Xi!.naturalMaps:=List( NaturalMaps(coprod_Xi), i-> CompositionPosetHomomorphisms(q,i));
	return wedge_Xi;
end);

InstallMethod(AutomorphismGroup,
"for Poset",
[IsPoset],
function(X)
	local n,f,sigma,automorphisms,sigmas,G,i,q,pi,p,Spi;
	n:=Size(X);
	automorphisms:=[];
	sigmas:=[];
	
	OrderMatrix(X);

	q:= i -> [Height(X,Set(X)[i]),Size(ElementsBelow(X,Set(X)[i])),Size(ElementsAbove(X,Set(X)[i]))];
	pi:=PartitionByFunction([1..n],q);
	Spi:=Group(Concatenation(List(pi, p-> GeneratorsOfGroup(SymmetricGroup(p)))));

	for sigma in Spi do
		f := PosetHomomorphismByImages(X,X, List([1..n], i-> Set(X)[i^sigma] ) );
		#f := StructuralCopy(PosetHomomorphismByFunction(X,X, x-> Set(X)[PositionSorted(Set(X),x)^StructuralCopy(sigma)] )); # not working, why???
		if f <> fail then
			Add(automorphisms,f );
			Add(sigmas,sigma);
		fi;
	od;
	for i in [1..Size(automorphisms)] do
		sigma:=sigmas[i];
		f:=automorphisms[i];
		SetOne(f,automorphisms[1]);
		SetInverse(f,automorphisms[PositionSorted(sigmas,sigma^-1)]);
	od;
	SortParallel(automorphisms,sigmas);
	G:=MagmaWithInverses(automorphisms);
	SetEnumerator(G,AsSSortedList(automorphisms));
	SetIsAssociative(G,true);
	IsGroup(G);
	Order(G);
	SetNiceMonomorphism(G,GroupHomomorphismByImagesNC(G,SymmetricGroup(n),automorphisms,sigmas));
	SetNiceObject(G,Group(sigmas));
	SetIsHandledByNiceMonomorphism(G,true);
	# SetIsAutomorphismGroup(G,true); ?
	# SetAutomorphismDomain(G,X); ?
	StructureDescription(G);
	return G;
end);

InstallMethod(Automorphisms,
"for Poset",
[IsPoset],
function(X)
	return Set(AutomorphismGroup(X));
end);

