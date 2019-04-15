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

InstallMethod(IsUpBeatPoint,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	local;
	if not x in Set(X) then
		Error("x must be an element of X");
	fi;
	return Size(UpperCovers(X,x))=1;
end);

InstallMethod(IsDownBeatPoint,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	local;
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
	return Filtered(Set(X), IsUpBeatPoint);
end);

InstallMethod(DownBeatPoints,
"for Poset",
[IsPoset],
function(X)
	return Filtered(Set(X), IsDownBeatPoint);
end);

InstallMethod(BeatPoints,
"for Poset",
[IsPoset],
function(X)
	return Filtered(Set(X), IsBeatPoint);
end);


InstallMethod(CorePoset,
"for Poset",
[IsPoset],
function(X)
	local coreX;
	# this can be optimized!
	coreX:=StructuralCopy(X);
	while Size(BeatPoints(coreX))>0 do
		coreX:=RemovePoint(X,BeatPoints(coreX)[1]);
	od;
	return SubPoset(X,Set(coreX));
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

InstallMethod(IsUpWeakPoint,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	local;
	if not x in Set(X) then
		Error("x must be an element of X");
	fi;
	return IsContractible(ElementsStrictlyAbove(X,x));
end);

InstallMethod(IsDownWeakPoint,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	local;
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
	return Filtered(Set(X), IsUpWeakPoint);
end);

InstallMethod(DownWeakPoints,
"for Poset",
[IsPoset],
function(X)
	return Filtered(Set(X), IsDownWeakPoint);
end);

InstallMethod(WeakPoints,
"for Poset",
[IsPoset],
function(X)
	return Filtered(Set(X), IsWeakPoint);
end);

	
