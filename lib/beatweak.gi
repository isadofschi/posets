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


InstallMethod(RemoveCoveringRelation, # TO DO!
"for Poset, coveringrelation",
[IsPoset, IsList],
function(X,e)
	return fail;
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
	local 	core, X1,
			inclusion_X1_X, inclusion_core_X1, retraction_X_X1, retraction_X1_core,
			x, _cl, cl, join, _r, r;
	if Size(BeatPoints(X))=0 then
		core:=PosetByFunctionNC(Set(X),Ordering(X));
		core!.naturalMaps:=[IdentityMap(X),IdentityMap(X)];
		return core;
	else

		# Union find to compute the retraction X --> X1
		_cl:=List([1..Size(X)], x -> -1);
		cl:=function(i)
			if _cl[i] =-1 then
				return i;
			else
				_cl[i]:=cl(_cl[i]);
				return _cl[i];
			fi;
		end;;
		join:=function(i,j)
			if not cl(i)=cl(j) then
				_cl[cl(i)] := cl(j);
			fi;
		end;;
		# We join each up/down beat point to the only upper/lower cover:
		if Size(UpBeatPoints(X)) > Size(DownBeatPoints(X)) then
			X1:=SubPoset(X, Difference(Set(X),UpBeatPoints(X)) );
			for x in UpBeatPoints(X) do
				join( PositionSorted(Set(X),x), PositionSorted(Set(X),UpperCovers(X,x)[1]) );
			od;
		else
			X1:=SubPoset(X, Difference(Set(X),DownBeatPoints(X)) );
			for x in DownBeatPoints(X) do
				join( PositionSorted(Set(X),x), PositionSorted(Set(X),LowerCovers(X,x)[1]) );
			od;
		fi;
		# memoization for the retraction cl
		_r:=List([1..Size(X)], x -> -1 );
		r:=function(i)
			if _r[i]=-1 then
				_r[i]:=cl(i);
			fi;
			return _r[i];
		end;

		core:=CorePoset(X1);
		inclusion_X1_X := NaturalMaps(X1)[1];
		retraction_X_X1:= PosetHomomorphismByFunction(X,X1, x->Set(X)[r(PositionSorted(Set(X),x))] );		
		inclusion_core_X1:=NaturalMaps(core)[1];
		retraction_X1_core:=NaturalMaps(core)[2];

		core!.naturalMaps:=[CompositionPosetHomomorphisms(inclusion_X1_X,inclusion_core_X1),
						    CompositionPosetHomomorphisms(retraction_X1_core,retraction_X_X1)
						  ];
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
		   IsContractible( SubPoset(X, Union(Set(ElementsBelow(X,a)),Set(ElementsBelow(X,b)))));
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
	
