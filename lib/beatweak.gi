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
