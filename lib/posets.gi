#############################################################################
##
#W  posets.gi             posets Package
##
##
##  
##  
##


PosetFamily:=NewFamily("PosetFamily",IsPoset);;
PosetType:=NewType(PosetFamily,  IsPoset );;

PosetHomomorphismFamily:=NewFamily("PosetHomomorphismFamily",IsPosetHomomorphism);;
PosetHomomorphismType:=NewType(PosetHomomorphismFamily,  IsPosetHomomorphism );;


################################################################################

PosetsIntFunc.NewPoset := function() return Objectify( PosetType, rec(names:=[], ordering:=(function(x,y) end) ) ); end ;;

################################################################################

# Basic methods

InstallMethod(ViewObj,"for Poset",
[IsPoset],
function(X)
	Print("<finite poset of size ", Size(X) ,">");
end);

InstallMethod(ViewObj,"for PosetHomomorphism",
[IsPosetHomomorphism],
function(X)
	Print("<order preserving map>");
end);

# Set of points (forgets order)
InstallMethod(Set,"for Poset",
[IsPoset],
function(X)
	return X!.names;
end);

# Ordering function
InstallMethod(Ordering,"for Poset",
[IsPoset],
function(X)
	return X!.ordering;
end);


# Size (number of points)
InstallMethod(Size,"for Poset",
[IsPoset],
function(X)
	return Size(Set(X));
end);


InstallMethod(\=,"for Poset and Poset",
[IsPoset,IsPoset],
function(X1,X2)
	return Set(X1)=Set(X2) and ForAll(Set(X1), x-> ForAll(Set(X1), y-> Ordering(X1)(x,y)=Ordering(X2)(x,y)));
end);

InstallMethod(\<,"for Poset and Poset",
[IsPoset,IsPoset],
function(X1,X2)
	return Set(X1)<Set(X2) or (Set(X1)=Set(X2) and OrderMatrix(X1)<OrderMatrix(X2));
end);

InstallMethod(\=,"for PosetHomomorphism and PosetHomomorphism",
[IsPosetHomomorphism,IsPosetHomomorphism],
function(f,g)
	return [f!.source, f!.target, List(Set(f!.source),f!.f) ] = [g!.source, g!.target, List(Set(g!.source), g!.f)];
end);

# the purpose of defining this is total order to consider Sets of poset homomorphisms
# this order is not meaningful (it is not the same as the partial order f<g := (forall x) fx<gx )
InstallMethod(\<,"for PosetHomomorphism and PosetHomomorphism",
[IsPosetHomomorphism,IsPosetHomomorphism],
function(f,g)
	return [f!.source, f!.target, List(Set(f!.source),f!.f) ] < [g!.source, g!.target, List(Set(g!.source), g!.f)];
end);

################################################################################
# Basic functions to build posets

InstallMethod(PosetByFunctionNC,
"for Set, Function",
[IsList,IsFunction],
function(X,f)
	return Objectify( PosetType, rec(names:=Set(X), ordering:=f) );
end);

InstallMethod(PosetByFunction,
"for Set, Function",
[IsList,IsFunction],
function(X,f)
	local namesX;
	namesX:=Set(X);
	if not ForAll(namesX, x->f(x,x)) then
		Error("The relation is not reflexive");
	fi;
	if not ForAll(namesX,x-> ForAll( namesX, y->  not (f(x,y) and f(y,x)) or x=y )) then
		Error("The relation is not antisymmetric");
	fi;
	if not ForAll(namesX,x-> ForAll( namesX, y-> ForAll(namesX,z -> (not (f(x,y) and f(y,z) ) or f(x,z) )))) then
		Error("The relation is not transitive");
	fi;
	return PosetByFunctionNC(namesX,f);
end);





InstallMethod(PosetByOrderMatrix,
"for List",
[IsList],
function(M)
	return PosetByOrderMatrix([],M);
end);

InstallMethod(PosetByOrderMatrix,
"for List, List",
[IsList,IsList],
function(names,M)
	local poset,n,sigma,ordering;

	n:=Length(M);
	
	sigma:=[1..n];

	if names=[] then
		names:=[1..n];
	fi;
	if Length(names)<>n then
		Error("names must have "+String(n)+" elements");
	fi;

	SortParallel(names,sigma);

	if not ForAll(M, v->Length(v)=n) then
		Error("M is not a square matrix");
	fi;

	M:=	M{sigma}{sigma};

	if ForAll(Concatenation(M), IsInt ) then
		M:=List(M,v->List(v,x -> x<>0));
	fi;

	if not ForAll(Concatenation(M), x->x in [true,false] ) then
		Error("Every element of M must be true or false");
	fi;


	ordering:=function(x,y) return M[PositionSorted(names,x)][PositionSorted(names,y)]; end;
	
	poset:=PosetByFunction(names,ordering);

	poset!.orderMatrix:=M;

	return poset;

end);

# turns a relation into a poset
InstallMethod(PosetByOrderRelation,
"for PartialOrderBinaryRelation",
[IsPartialOrderBinaryRelation],
function(R)
	# this should be done without calling PosetByOrderMatrix!
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
	return PosetByOrderMatrix(names,M);
		
end);

InstallMethod(PosetByCoveringRelations,
"for List, List",
[IsList,IsList],
function(names,coveringRelations)
	local R;
	R:=TransitiveClosureBinaryRelation(ReflexiveClosureBinaryRelation(BinaryRelationByElements(Domain(Set(names)), List(coveringRelations,Tuple))));
	if not IsAntisymmetricBinaryRelation(R) then
		return fail;
	fi;
	return PosetByOrderRelation(R);
end);


##################################################################################################

# Methods to construct poset homomorphisms

InstallMethod(PosetHomomorphismByFunctionNC,
"for Poset, Poset and function",
[IsPoset, IsPoset, IsFunction],
function(X,Y,f)
	return Objectify( PosetHomomorphismType, rec(source:=X, target:=Y, f:=f) );
end);

InstallMethod(PosetHomomorphismByFunction,
"for Poset, Poset and function",
[IsPoset, IsPoset, IsFunction],
function(X,Y,f)
	if not ForAll(Set(X),
				  x1->ForAll(Set(X),
                             x2-> (not Ordering(X)(x1,x2)) or Ordering(Y)(f(x1),f(x2))
							)
				)
	then
		return fail;
	fi;
	return PosetHomomorphismByFunctionNC(X,Y,f);
end);

InstallMethod(PosetHomomorphismByImages,
"for Poset, Poset and List",
[IsPoset, IsPoset, IsList],
function(X,Y,ims)
	local f;
	if not Length(ims)=Size(X) and ForAll(ims, y->y in Set(Y) ) then
		Error("invalid arguments");
	fi;
	f:=function(x)
		return ims[PositionSorted(Set(X),x)];
	end;
	return PosetHomomorphismByFunction(X,Y,f);
end);

InstallMethod(PosetHomomorphismByMapping,
"for Poset, Poset and List",
[IsPoset, IsPoset, IsMapping],
function(X,Y,f)
	local fn;
	if not Source(f)=Set(X) and IsSubset(Set(Y), Set(Range(f)) ) then
		Error("invalid arguments");
	fi;
	fn:=function(x)
		return Image(f,x);
	end;
	return PosetHomomorphismByFunction(X,Y,fn);
end);

##################################################################################################


#InstallMethod(IdentityMapping,
#"for Poset",
#[IsPoset],
#function(X)
#	return Objectify( PosetHomomorphismType, rec(source:=X, target:=X, images:=[1..(Size(X))]) );
#end);


## Turns a poset into an order relation
InstallMethod(RelationByPoset,
"for Poset",
[IsPoset],
function(X)
	local n;
	n:=Size(X);
	return PartialOrderByOrderingFunction( Domain(Set(X)), X!.ordering );
end);




####################
InstallMethod(OrderMatrix,
"for Poset",
[IsPoset],
function(X)
	local n,M,i,j;
	if not IsBound(X!.orderMatrix) then
		n:=Size(X);
		M:=List([1..n],x->List([1..n], ReturnFalse));
		for i in [1..n] do
			for j in [1..n] do
				M[i][j]:=Ordering(X)(Set(X)[i],Set(X)[j]);
			od;
		od;
		X!.orderMatrix:=M;
	fi;
	return X!.orderMatrix;
end);

InstallMethod(HasseDiagram,
"for Poset",
[IsPoset],
function(X)
	local R,h;
	if not IsBound(X!.lowerCovers) then
		R:=RelationByPoset(X);
		h:=HasseDiagramBinaryRelation(R);
		X!.lowerCovers:=List(Set(Source(h)), x->Set(Images(h,x)) );
		X!.upperCovers:=List([1..Size(X)], i -> Set(Filtered(Set(X), y -> Set(X)[i] in X!.lowerCovers[PositionSorted(Set(X),y)] )));
	fi;
	return X!.lowerCovers;
end);

InstallMethod(UpperCovers,
"for Poset and element",
[IsPoset,IsObject],
function(X,x)
	HasseDiagram(X);
	return X!.upperCovers[PositionSorted(Set(X),x)];
end);

InstallMethod(LowerCovers,
"for Poset and element",
[IsPoset,IsObject],
function(X,x)
	HasseDiagram(X);
	return X!.lowerCovers[PositionSorted(Set(X),x)];
end);



InstallMethod(CoveringRelations,
"for Poset",
[IsPoset],
function(X)
	if not IsBound(X!.coveringRelations) then
		X!.coveringRelations := Concatenation( List( [1..Size(X)], i-> List(HasseDiagram(X)[i], j-> [ Set(X)[i], Set(X)[j] ]) ) );
	fi;
	return X!.coveringRelations;
end);

