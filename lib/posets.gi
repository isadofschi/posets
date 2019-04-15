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


################################################################################
# Basic functions to build posets and morphisms
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
	poset!.ordering:=function(x,y) return M1[PositionSorted(names,x)][PositionSorted(names,y)]; end;
	poset!.names:=names;

	return poset;

end);

InstallMethod(PosetHomomorphismByImagesNC,
"for Poset, Poset and function",
[IsPoset, IsPoset, IsList],
function(X,Y,f)
	return Objectify( PosetHomomorphismType, rec(source:=X, target:=Y, f:=f) );
end);

InstallMethod(PosetHomomorphismByImages,
"for Poset, Poset and function",
[IsPoset, IsPoset, IsList],
function(X,Y,f)
	if not ForAll(Set(X),
				  x1->ForAll(Set(X),
                             x2-> (not Ordering(X)(x1,x2)) or Ordering(Y)(f(x1),f(x2))
							)
				)
	then
		Error("the map is not order preserving");
	fi;
	return PosetHomomorphismByImagesNC(X,Y,f);
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
	# the following computation could be done faster if we already know the hasse diagram of X
	return Objectify( PosetHomomorphismType, rec(source:=X, target:=Y, f:=f, images:=ims) );
end);

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
	return PosetByOrderMatrix(M,names); # estamos chequeando cosas innecesariamente, por ejemplo transitividad
		
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
	if not IsBound(X!.HasseDiagramNumbers) then
		R:=RelationByPoset(X);
		h:=HasseDiagramBinaryRelation(R);
		X!.HasseDiagramNames:=List(Set(Source(h)), x->Images(h,x));
		X!.HasseDiagramNumbers:= List(X!.HasseDiagramNames, x-> List(x, y-> PositionSorted(Set(X),y)));
	fi;
	return X!.HasseDiagramNumbers;
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

