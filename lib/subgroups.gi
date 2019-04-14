LoadPackage("SONATA");

InstallMethod(PosetOfSubgroups,
"for Group",
[IsGroup and IsFinite],
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



InstallGlobalFunction(RadicalpSubgroups, function(G,p)
	local BpP, BpG, H, i, g, numClasesConjugacion, normalizers, transversals,
	CanonicalRightTransversal,reduceConjClasses,radicalSubgroupsConjClasses;

	reduceConjClasses:=function(G,l)
		local reducedList, add, a, b;
		reducedList:=[];
		for a in l do
			add:=true;
			for b in reducedList do
				if IsConjugate(G,a,b) then
					add:=false;
					break;
				fi;
			od;
			if add then
				Add(reducedList,a);
			fi;
		od;
		return reducedList;	
	end;;


	radicalSubgroupsConjClasses:=function(G,p)
		local S, subgroups, l;
		S:=SylowSubgroup(G,p);
		subgroups:=Set(Filtered(SubgroupsSolvableGroup(S), l-> Order(l) > 1));
		return Filtered(subgroups, l-> Size(l) = Size(PCore(Normalizer(G,l),p)));
	end;;

	BpP:=reduceConjClasses(G,radicalSubgroupsConjClasses(G,p));
	
	numClasesConjugacion:=Size(BpP);
	normalizers:=List(BpP, H-> Normalizer(G,H));
	
	CanonicalRightTransversal:= function(G,H)
		return List(RightTransversal(G,H),i->CanonicalRightCosetElement(H,i));
	end;;
	
	transversals:=List(normalizers, N-> CanonicalRightTransversal(G,N));
	BpG:=[];
	
	for i in  [1..numClasesConjugacion] do
		for g in transversals[i] do
			H:=BpP[i]^g;
			Add(BpG, H);
		od;
	od;
	return BpG;
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
	Bp:=RadicalpSubgroups(G,p);	
	#Bp:=Filtered(S, H-> IsPGroup(H) and RemInt(Order(H),p)=0 and Order(H)=Order(PCore(Normalizer(G,H),p)) );
	return PosetByFunctionNC(Bp,IsSubgroup);
end);
