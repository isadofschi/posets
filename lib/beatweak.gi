InstallMethod(ElementsBelow,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	local i;
	if not x in Set(X) then
		Error("x must be an element of X");
	fi;
	if not "ListElementsBelow" in NamesOfComponents(X) then
		X!.ListElementsBelow:= List(Set(X), ReturnFalse);
	fi;
	i:=PositionSorted(Set(X),x);
	if X!.ListElementsBelow[i]=false then
		X!.ListElementsBelow[i]:=SubPoset(X,Filtered(Set(X),y->Ordering(X)(x,y)));
	fi;
	return X!.ListElementsBelow[i];
end);

InstallMethod(ElementsStrictlyBelow,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	if not x in Set(X) then
		Error("x must be an element of X");
	fi;
	return RemovePoint(ElementsBelow(X,x),x);
end);

InstallMethod(ElementsAbove,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	local i;
	if not x in Set(X) then
		Error("x must be an element of X");
	fi;
	if not "ListElementsAbove" in NamesOfComponents(X) then
		X!.ListElementsAbove:= List(Set(X), ReturnFalse);
	fi;
	i:=PositionSorted(Set(X),x);
	if X!.ListElementsAbove[i]=false then
		X!.ListElementsAbove[i]:=SubPoset(X,Filtered(Set(X),y->Ordering(X)(y,x)));
	fi;
	return X!.ListElementsAbove[i];
end);

InstallMethod(ElementsStrictlyAbove,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	if not x in Set(X) then
		Error("x must be an element of X");
	fi;
	return RemovePoint(ElementsAbove(X,x),x);
end);


InstallMethod(ElementsComparable,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	local Cx;
	if not x in Set(X) then
		Error("x must be an element of X");
	fi;
	Cx:=Filtered(Set(X),y->Ordering(X)(x,y) or Ordering(X)(y,x));
	return SubPoset(X,Cx);
end);

InstallMethod(ElementsStrictlyComparable,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	local Cxhat;
	if not x in Set(X) then
		Error("x must be an element of X");
	fi;
	Cxhat:=Filtered(Set(X),y->(Ordering(X)(x,y) or Ordering(X)(y,x)) and x<>y);
	return SubPoset(X,Cxhat);
end);

#############################################################################

InstallMethod(RemovePoint,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	if not x in Set(X) then
		Error("x must be an element of X");
	fi;
	return SubPoset(X,Filtered(Set(X),y->y<>x));
end);


InstallMethod(RemoveCoveringRelation,
"for Poset, coveringrelation",
[IsPoset, IsList],
function(X,e)
	local X_e;
	if e in CoveringRelations(X) then
		X_e:=PosetByCoveringRelations(Set(X),Difference(CoveringRelations(X),[e]));
		X_e!.naturalMaps:=[ PosetHomomorphismByFunctionNC(X_e,X,x->x) ];
		return X_e;
	else
		return fail;
	fi;
end);

#############################################################################

InstallMethod(IsUpBeatPoint,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	local a;
	if not x in Set(X) then
		Error("x must be an element of X");
	fi;
	if HasCoveringRelations(X) then
		return Size(UpperCovers(X,x))=1;
	else
		a:=Size(ElementsAbove(X,x));
		return ForAny(Set(ElementsAbove(X,x)), y-> Size(ElementsAbove(X,y))=a-1);
	fi;
end);

InstallMethod(IsDownBeatPoint,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	local a;
	if not x in Set(X) then
		Error("x must be an element of X");
	fi;
	if HasCoveringRelations(X) then
		return Size(LowerCovers(X,x))=1;
	else
		a:=Size(ElementsBelow(X,x));
		return ForAny(Set(ElementsBelow(X,x)), y-> Size(ElementsBelow(X,y))=a-1);
	fi;
end);

InstallMethod(IsBeatPoint,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	if not x in Set(X) then
		Error("x must be an element of X");
	fi;
	return IsUpBeatPoint(X,x) or IsDownBeatPoint(X,x);
end);

InstallMethod(UpBeatPoints,
"for Poset",
[IsPoset],
function(X)
	return Filtered(Set(X), x->IsUpBeatPoint(X,x));
end);

InstallMethod(DownBeatPoints,
"for Poset",
[IsPoset],
function(X)
	return Filtered(Set(X), x-> IsDownBeatPoint(X,x) );
end);

InstallMethod(BeatPoints,
"for Poset",
[IsPoset],
function(X)
	return Filtered(Set(X), x-> IsBeatPoint(X,x) );
end);

#############################################################################

InstallMethod(Core,
"for Poset",
[IsPoset],
function(X)
	local
		X1, changes, direction,
		UpOrDownBeatPoints, ElementsAboveOrBelow, UpperOrLowerCovers,
		beat_points, x, y, a, i,
		dfs, _r, r, ady_in,
		inclusion_core_X, retraction_X_core;

	X1:=StructuralCopy(X);
	_r:=List([1..Size(X)], x -> -1 );
	ady_in:=List([1..Size(X)],x->[]);
	changes:=true;
	while changes do
		changes:=false;
		for direction in ["up","down"] do
			if direction="up" then
				UpOrDownBeatPoints:=UpBeatPoints;
				ElementsAboveOrBelow:=ElementsAbove;	
				UpperOrLowerCovers:=UpperCovers;
			else
				UpOrDownBeatPoints:=DownBeatPoints;
				ElementsAboveOrBelow:=ElementsBelow;
				UpperOrLowerCovers:=LowerCovers;
			fi;
			beat_points:=[];
			for x in X1 do		
				if HasCoveringRelations(X1) then
					if Size(UpperOrLowerCovers(X1,x))=1 then
						# x is a beat point!
						changes:=true;
						Add(beat_points,x);
						Add(ady_in[PositionSorted(Set(X),UpperOrLowerCovers(X,x)[1])], PositionSorted(Set(X),x));
					fi;
				else
					a:=Size(ElementsAboveOrBelow(X1,x));
					for y in Set(ElementsAboveOrBelow(X1,x)) do
						if Size(ElementsAboveOrBelow(X1,y))=a-1 then
							# x is a beat point!
							changes:=true;
							Add(beat_points,x);
							Add(ady_in[PositionSorted(Set(X),y)], PositionSorted(Set(X),x));
							break;
						fi;
					od;
				fi;
			od;
			X1:=PosetByFunctionNC(Difference(Set(X1),beat_points),Ordering(X));
		od;
	od;
	dfs:=function(i)
		local j;
		for j in ady_in[i] do
			_r[j]:=_r[i];
			dfs(j);
		od;
	end;
	for x in Set(X1) do
		i:=PositionSorted(Set(X),x);
		_r[i]:=i;
		dfs(i);
	od;
	r:=function(i)
		return Set(X)[_r[PositionSorted(Set(X),x)]];
	end;
	inclusion_core_X := PosetHomomorphismByFunctionNC(X1,X,x->x);
	retraction_X_core:= PosetHomomorphismByFunctionNC(X,X1,r);
	SetNaturalMaps(X1, [ inclusion_core_X,retraction_X_core]);
	return X1;
end);



InstallMethod(IsContractible,
"for Poset",
[IsPoset],
function(X)
	# optimization:
	#if X.has_top() or X.has_bottom():
	#	return True
	return Size(Core(X)) = 1;
end);

InstallMethod(HomotopyEquivalence,
"for Poset and Poset",
[IsPoset,IsPoset],
function(X,Y)
	local coreX,coreY,f,i_coreY_Y,r_X_coreX;
	coreX:=Core(X);
	coreY:=Core(Y);
	f:=IsomorphismPosets(coreX,coreY);
	if f=fail then
		return fail;
	else
		i_coreY_Y:=NaturalMaps(coreY)[1];
		r_X_coreX:=NaturalMaps(coreX)[2];
		# composition of 3 maps is not implemented:
		return CompositionPosetHomomorphisms(i_coreY_Y, CompositionPosetHomomorphisms(f,r_X_coreX));
	fi;
end);

#############################################################################

InstallMethod(IsUpWeakPoint,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	if not x in Set(X) then
		Error("x must be an element of X");
	fi;
	return IsContractible(ElementsStrictlyAbove(X,x));
end);

InstallMethod(IsDownWeakPoint,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	if not x in Set(X) then
		Error("x must be an element of X");
	fi;
	return IsContractible(ElementsStrictlyBelow(X,x));
end);

InstallMethod(IsWeakPoint,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	if not x in Set(X) then
		Error("x must be an element of X");
	fi;
	return IsUpWeakPoint(X,x) or IsDownWeakPoint(X,x);
end);

InstallMethod(UpWeakPoints,
"for Poset",
[IsPoset],
function(X)
	return Filtered(Set(X), x->IsUpWeakPoint(X,x));
end);

InstallMethod(DownWeakPoints,
"for Poset",
[IsPoset],
function(X)
	return Filtered(Set(X), x->IsDownWeakPoint(X,x));
end);

InstallMethod(WeakPoints,
"for Poset",
[IsPoset],
function(X)
	return Filtered(Set(X), x->IsWeakPoint(X,x));
end);

#############################################################################

InstallMethod(WeakCore,
"for Poset",
[IsPoset],
function(X)
	local weak_core, X1, inclusion_X1_X, inclusion_weakcore_X1;
	if Size(WeakPoints(X))=0 then
		return SubPoset(X,Set(X));
	else
		if Size(UpWeakPoints(X)) > Size(DownWeakPoints(X)) then
			X1:=SubPoset(X, Difference(Set(X),UpWeakPoints(X)) );
		else
			X1:=SubPoset(X, Difference(Set(X),DownWeakPoints(X)) );
		fi;

		weak_core:=WeakCore(X1);
		inclusion_X1_X := NaturalMaps(X1)[1];
		inclusion_weakcore_X1:=NaturalMaps(weak_core)[1];

		weak_core!.naturalMaps:=[CompositionPosetHomomorphisms(inclusion_X1_X,inclusion_weakcore_X1)];
		return weak_core;
	fi;

end);





InstallMethod(MinWeakCore,
"for Poset",
[IsPoset],
function(X) 
	local visited, dfs;
	dfs:= function(A)
		local x,min_weak_core,S,Y;
		min_weak_core:=ShallowCopy(A);
		for x in WeakPoints(SubPoset(X,A)) do 
			S:=Difference(A,[x]);
			if not KnowsDictionary(visited,S) then
				AddDictionary(visited,S);
				Y := dfs(S); 
				if Size(Y)<Size(min_weak_core) then
					min_weak_core:=Y;
				fi;
			fi;
		od;
		return min_weak_core;
	end;;
	visited:= NewDictionary(Set(X),false); 
	return SubPoset(X,dfs(Set(X)));
end);



InstallMethod(IsCollapsible,
"for Poset",
[IsPoset],
function(X)
	return Size(MinWeakCore(X))=1;
end);

