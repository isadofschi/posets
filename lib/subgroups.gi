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
	local SpG;
	if not IsPrime(p) then
		Error("p must be prime");
	fi;
	SpG:=PosetByFunctionNC(Filtered(Subgroups(G), H-> IsPGroup(H) and RemInt(Order(H),p)=0), IsSubgroup);
	SetGrading(SpG,H-> Log(Order(H),p)-1); # Sp(G) is a graded poset
	return SpG;
end);



InstallGlobalFunction(ElementaryAbelianpSubgroups, function(G,p,r...)
	local partialSubgroups, S, H, l, repElemAb, elemAb, g, i, normalizersElemAb, transversalsElemAb, numClasesConjugacion, CanonicalRightTransversal,reduceConjClasses;

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

	S:=SylowSubgroup(G,p);
	if r<>[] then
		r:=r[1];
		partialSubgroups:=Filtered(SubgroupsSolvableGroup(S), l->IsElementaryAbelian(l) and Order(l) > 1 and Order(l) <= p^r);
	else
		partialSubgroups:=Filtered(SubgroupsSolvableGroup(S), l->IsElementaryAbelian(l) and Order(l) > 1);
	fi;
	
	repElemAb:=reduceConjClasses(G,partialSubgroups);
	
	numClasesConjugacion:=Size(repElemAb);
	normalizersElemAb:=List(repElemAb, H-> Normalizer(G,H));
	
	CanonicalRightTransversal:= function(G,H)
		return List(RightTransversal(G,H),i->CanonicalRightCosetElement(H,i));
	end;;
	
	transversalsElemAb:=List(normalizersElemAb, N-> CanonicalRightTransversal(G,N));
	
	elemAb:=[];
	
	for i in  [1..numClasesConjugacion] do
		for g in transversalsElemAb[i] do
			H:=repElemAb[i]^g;
			Add(elemAb, H);
		od;
	od;
	
	return elemAb;
	
end);


InstallMethod(PosetOfElementaryAbelianpSubgroups,
"for Group, Integer",
[IsGroup and IsFinite,IsInt],
function(G,p)
	# the ordering is >=
	local ApG;
	if not IsPrime(p) then
		Error("p must be prime");
	fi;
	ApG:=PosetByFunctionNC(ElementaryAbelianpSubgroups(G,p) , IsSubgroup);
	SetGrading(ApG,H-> Log(Order(H),p)-1); # Ap(G) is a graded poset
	return ApG;
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
