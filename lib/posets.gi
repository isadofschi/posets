#############################################################################
##
#W  posets.gi             posets Package
##
##
##  
##  
##


PosetFamily:=NewFamily("PosetFamily",IsPoset and IsCopyable);;
PosetType:=NewType(PosetFamily,  IsPoset and IsAttributeStoringRep);;



################################################################################

#PosetsIntFunc.NewPoset := function() return Objectify( PosetType, rec(names:=[], ordering:=(function(x,y) end) ) ); end ;;

################################################################################

# Basic methods

InstallMethod(ViewObj,
"for Poset",
[IsPoset],
function(X)
	Print("<finite poset of size ", Size(X) ,">");
end);




InstallMethod(PrintObj,"for Poset",
[IsPoset],
function(X)
	Print("<finite poset of size ", Size(X) ,">");
end);


# Set of points (forgets order)
InstallMethod(Set,"for Poset",
[IsPoset],
function(X)
	return X!.names;
end);

# Ordering function
InstallMethod(Ordering,
"for Poset",
[IsPoset],
function(X)
	return X!.ordering;
end);


# Size (number of points)
InstallMethod(Size,
"for Poset",
[IsPoset],
function(X)
	return Size(Set(X));
end);

InstallMethod(Iterator,
"for Poset",
[IsPoset],
X-> Iterator(Set(X))
);

InstallOtherMethod(\in, # InstallOtherMethod, is this related to issue #1649?
"for element and Poset",
[IsObject,IsPoset],
function(x,X)
	return x in Set(X);
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

InstallMethod(PosetByOrderMatrixNC,
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

InstallMethod(PosetByOrderMatrixNC,
"for List, List",
[IsList,IsList],
function(names,M)
	local poset,n,sigma,ordering;
	n:=Length(M);
	sigma:=[1..n];
	if names=[] then
		names:=[1..n];
	fi;
	SortParallel(names,sigma);
	M:=M{sigma}{sigma};
	ordering:=function(x,y) return M[PositionSorted(names,x)][PositionSorted(names,y)]; end;
	poset:=PosetByFunctionNC(names,ordering);
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
	# (some checks here)
	R:=TransitiveClosureBinaryRelation(ReflexiveClosureBinaryRelation(BinaryRelationByElements(Domain(Set(names)), List(coveringRelations,Tuple))));
	if not IsAntisymmetricBinaryRelation(R) then
		return fail;
	fi;
	return PosetByOrderRelation(R);
end);


##################################################################################################


## Turns a poset into an order relation on [1..n]
InstallMethod(RelationByPoset,
"for Poset",
[IsPoset],
function(X)
	return PartialOrderByOrderingFunction( Domain([1..Size(X)]),
											function(i,j) return Ordering(X)(Set(X)[i],Set(X)[j]);end
	);
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
	X!.ordering:=function(x,y) return X!.orderMatrix[PositionSorted(Set(X),x)][PositionSorted(Set(X),y)]; end;
	return X!.orderMatrix;
	
end);


InstallMethod(OrderingByIndex,
"for Poset",
[IsPoset],
function(X)
	local o;
	o:=function(i,j)
		if HasOrderMatrix(X) then
			return OrderMatrix(X)[i][j];
		fi;
		return Ordering(X)(Set(X)[i],Set(X)[j]);
	end;;
	return o;
end);


InstallMethod(UpperCovers,
"for Poset",
[IsPoset],
function(X)
	local uppercovers,c;
	uppercovers:=List([1..Size(X)], x->[]);
	for c in CoveringRelations(X) do
		Add(uppercovers[PositionSorted(Set(X),c[2])],c[1]);
	od;
	return x -> uppercovers[PositionSorted(Set(X),x)];
end);


InstallMethod(UpperCovers,
"for Poset and element",
[IsPoset,IsObject],
function(X,x)
	return UpperCovers(X)(x);
end);

InstallMethod(LowerCovers,
"for Poset",
[IsPoset],
function(X)
	local lowercovers,c;
	lowercovers:=List([1..Size(X)], x->[]);
	for c in CoveringRelations(X) do
		Add(lowercovers[PositionSorted(Set(X),c[1])],c[2]);
	od;
	return x -> lowercovers[PositionSorted(Set(X),x)];
end);

InstallMethod(LowerCovers,
"for Poset and element",
[IsPoset,IsObject],
function(X,x)
	return LowerCovers(X)(x);
end);

InstallMethod(CoveringRelations,
"for Poset",
[IsPoset],
function(X)
	local hasse_diagram,n;
	# if we know a grading for X we have a faster method
	if HasGrading(X) and Grading(X)<>fail then
		return Concatenation( List(Set(X), x-> List(Filtered(Set(X), y-> (Grading(X)(x) = 1+Grading(X)(y) ) and Ordering(X)(x,y) ), y-> [x,y] )));
	fi;
	# otherwise we compute covering relations from the Hasse diagram
	hasse_diagram := HasseDiagramBinaryRelation(RelationByPoset(X));
	n:=Size(X);
	return Set(Concatenation( List( [1..n], i-> List( Images( hasse_diagram, i ), j-> [ Set(X)[i], Set(X)[j] ] ))));
end);

InstallMethod(MaximalElements,
"for Poset",
[IsPoset],
function(X)
	return Filtered(Set(X), x-> UpperCovers(X,x)=[] ); # this is efficient if we already computed the upper covers, not in general!
end);

InstallMethod(MinimalElements,
"for Poset",
[IsPoset],
function(X)
	return Filtered(Set(X), x-> LowerCovers(X,x)=[] ); # this is efficient if we already computed the lower covers, not in general!
end);

InstallMethod(MaximumPoset,
"for Poset",
[IsPoset],
function(X)
	if Length(MaximalElements(X))=1 then
		return MaximalElements(X)[1];
	else
		return fail;
	fi;
end);

InstallMethod(MinimumPoset,
"for Poset",
[IsPoset],
function(X)
	if Length(MinimalElements(X))=1 then
		return MinimalElements(X)[1];
	else
		return fail;
	fi;
end);

InstallMethod(IndicesElementsAbove,
"for Poset",
[IsPoset],
function(X)
	local n,l;
	n:=Size(X);
	l:=List([1..n], i-> Filtered([1..n], j-> Ordering(X)(Set(X)[j],Set(X)[i])));
	return l;
end);

InstallMethod(IndicesElementsBelow,
"for Poset",
[IsPoset],
function(X)
	local n,l;
	n:=Size(X);
	l:=List([1..n], i-> Filtered([1..n], j-> Ordering(X)(Set(X)[i],Set(X)[j])));
	return l;
end);

InstallMethod(SavePosetAsListsOfElementsBelow,
"for Poset and filename",
[IsPoset,IsString],
function(X,filename)
	local l,f,i,j;
	l:=IndicesElementsBelow(X);
	f := IO_File(filename,"w");
	IO_Write(f, Size(X));
	IO_Write(f, "\n");
	for i in [1..Size(X)] do
		IO_Write(f,Length(l[i]));
		IO_Write(f,"\n");
		for j in l[i] do
			IO_Write(f, j);
			IO_Write(f, " ");
		od;
		IO_Write(f, "\n");
	od;
	IO_Flush(f);
	IO_Close(f);
end);

InstallMethod(SavePosetAsOrderMatrix,
"for Poset and filename",
[IsPoset,IsString],
function(X,filename)
	local M,f,i,j;
	M:=OrderMatrix(X);
	f := IO_File(filename,"w");
	IO_Write(f, Size(X));
	IO_Write(f, "\n");
	for i in [1..Size(X)] do
		for j in [1..Size(X)] do
			if M[i][j] then
				IO_Write(f, 1);
			else
				IO_Write(f, 0);
			fi;
			IO_Write(f, " ");
		od;
		IO_Write(f, "\n");
	od;
	IO_Flush(f);
	IO_Close(f);
end);
