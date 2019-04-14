LoadPackage("SONATA");

InstallMethod(PosetOfSubgroups,
"for Group, Integer",
[IsGroup and IsFinite,IsInt],
function(G)
	# the ordering is >=
	local S;
	S:=Subgroups(G);
	return PosetByFunctionNC(S,IsSubgroup);
end);

InstallMethod(PosetOfpSubgroups,
"for Group, Integer",
[IsGroup and IsFinite,IsInt],
function(G,p)
	# the ordering is >=
	local S,Sp;
	if not IsPrime(p) then
		Error("p must be prime");
	fi;
	S:=Subgroups(G);
	Sp:=Filtered(S, H-> IsPGroup(H) and RemInt(Order(H),p)=0);
	return PosetByFunctionNC(Sp,IsSubgroup);
end);

InstallMethod(PosetOfElementaryAbelianpSubgroups,
"for Group, Integer",
[IsGroup and IsFinite,IsInt],
function(G,p)
	# the ordering is >=
	local S,Ap;
	if not IsPrime(p) then
		Error("p must be prime");
	fi;
	S:=Subgroups(G);
	Ap:=Filtered(S, H-> IsPGroup(H) and RemInt(Order(H),p)=0 and IsElementaryAbelian(H) );
	return PosetByFunctionNC(Ap,IsSubgroup);
end);

InstallMethod(PosetOfRadicalpSubgroups,
"for Group, Integer",
[IsGroup and IsFinite,IsInt],
function(G,p)
	# the ordering is >=
	local S,Bp;
	if not IsPrime(p) then
		Error("p must be prime");
	fi;
	S:=Subgroups(G);
	Bp:=Filtered(S, H-> IsPGroup(H) and RemInt(Order(H),p)=0 and Order(H)=Order(PCore(Normalizer(G,H),p)) );
	return PosetByFunctionNC(Bp,IsSubgroup);
end);
