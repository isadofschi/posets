InstallMethod(ElementsBelow,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	local Ux;
	if not x in Set(X) then
		Error("x must be an element of X");
	fi;
	Ux:=Filtered(Set(X),y->Ordering(X)(x,y));
	return SubPoset(X,Ux);
end);

InstallMethod(ElementsStrictlyBelow,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	local Uxhat;
	if not x in Set(X) then
		Error("x must be an element of X");
	fi;
	Uxhat:=Filtered(Set(X),y->Ordering(X)(x,y) and x<>y);
	return SubPoset(X,Uxhat);
end);

InstallMethod(ElementsAbove,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	local Fx;
	if not x in Set(X) then
		Error("x must be an element of X");
	fi;
	Fx:=Filtered(Set(X),y->Ordering(X)(y,x));
	return SubPoset(X,Fx);
end);

InstallMethod(ElementsStrictlyAbove,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	local Fxhat;
	if not x in Set(X) then
		Error("x must be an element of X");
	fi;
	Fxhat:=Filtered(Set(X),y->Ordering(X)(y,x) and x<>y);
	return SubPoset(X,Fxhat);
end);


InstallMethod(ElementsComparable,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	local Fx;
	if not x in Set(X) then
		Error("x must be an element of X");
	fi;
	Fx:=Filtered(Set(X),y->Ordering(X)(x,y) or Ordering(X)(y,x));
	return SubPoset(X,Fx);
end);

InstallMethod(ElementsStrictlyComparable,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	local Fxhat;
	if not x in Set(X) then
		Error("x must be an element of X");
	fi;
	Fxhat:=Filtered(Set(X),y->(Ordering(X)(x,y) or Ordering(X)(y,x)) and x<>y);
	return SubPoset(X,Fxhat);
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
		X_e!.naturalMaps:=[ PosetHomomorphismByFunction(X_e,X,x->x) ];
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
	if not x in Set(X) then
		Error("x must be an element of X");
	fi;
	return Size(UpperCovers(X,x))=1;
end);

InstallMethod(IsDownBeatPoint,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	if not x in Set(X) then
		Error("x must be an element of X");
	fi;
	return Size(LowerCovers(X,x))=1;
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

InstallMethod(CorePoset,
"for Poset",
[IsPoset],
function(X)
	local
		core, X1,
		inclusion_X1_X, inclusion_core_X1, retraction_X_X1, retraction_X1_core,
		x, i, UpOrDownBeatPoints, UpperOrLowerCovers, ady_in, dfs, _r, r;
	if Size(BeatPoints(X))=0 then
		core:=PosetByFunctionNC(Set(X),Ordering(X));
		core!.naturalMaps:=[IdentityMap(X),IdentityMap(X)];
		return core;
	else
		_r:=List([1..Size(X)], x -> -1 );
		ady_in:=List([1..Size(X)],x->[]);

		if Size(UpBeatPoints(X)) > Size(DownBeatPoints(X)) then # we remove up or down beat points?
			UpOrDownBeatPoints:=UpBeatPoints;
			UpperOrLowerCovers:=UpperCovers;
		else
			UpOrDownBeatPoints:=DownBeatPoints;
			UpperOrLowerCovers:=LowerCovers;
		fi;
		X1:=SubPoset(X, Difference(Set(X),UpOrDownBeatPoints(X)));

		# now we compute the retraction r: X --> X1
		for x in UpOrDownBeatPoints(X) do
			Add( ady_in[PositionSorted(Set(X),UpperOrLowerCovers(X,x)[1])], PositionSorted(Set(X),x) );
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

		core:=CorePoset(X1);
		inclusion_X1_X := NaturalMaps(X1)[1];
		retraction_X_X1:= PosetHomomorphismByFunction(X,X1,r);		
		inclusion_core_X1:=NaturalMaps(core)[1];
		retraction_X1_core:=NaturalMaps(core)[2];

		core!.naturalMaps:=[
			CompositionPosetHomomorphisms(inclusion_X1_X,inclusion_core_X1),
			CompositionPosetHomomorphisms(retraction_X1_core,retraction_X_X1) ];
		return core;
	fi;

end);

InstallMethod(IsContractible,
"for Poset",
[IsPoset],
function(X)
	# optimization:
	#if X.has_top() or X.has_bottom():
	#	return True
	return Size(CorePoset(X)) = 1;
end);

InstallMethod(HomotopyEquivalence,
"for Poset and Poset",
[IsPoset,IsPoset],
function(X,Y)
	local coreX,coreY,f,i_coreY_Y,r_X_coreX;
	coreX:=CorePoset(X);
	coreY:=CorePoset(Y);
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

InstallMethod(WeakCorePoset,
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

		weak_core:=WeakCorePoset(X1);
		inclusion_X1_X := NaturalMaps(X1)[1];
		inclusion_weakcore_X1:=NaturalMaps(weak_core)[1];

		weak_core!.naturalMaps:=[CompositionPosetHomomorphisms(inclusion_X1_X,inclusion_weakcore_X1)];
		return weak_core;
	fi;

end);

#############################################################################

InstallMethod(IsQCReduction,
"for Poset, element and element",
[IsPoset,IsObject,IsObject],
function(X,a,b)
	if not (a in Set(X) and b in Set(X)) then
		return Error("a and b must be elements of X");
	fi;
	 
	return UpperCovers(X,a)=[] and
		   UpperCovers(X,b)=[] and
		   IsContractible(SubPoset(X, Union(Set(ElementsBelow(X,a)),Set(ElementsBelow(X,b)))));
end);

InstallMethod(IsQCopReduction,
"for Poset, element and element",
[IsPoset,IsObject,IsObject],
function(X,a,b)
	if not (a in Set(X) and b in Set(X)) then
		return Error("a and b must be elements of X");
	fi;
	 
	return LowerCovers(X,a)=[] and
		   LowerCovers(X,b)=[] and
		   IsContractible( SubPoset(X, Union(Set(ElementsAbove(X,a)),Set(ElementsAbove(X,b)))));
end);
	
