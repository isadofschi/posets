InstallGlobalFunction(RandomWeakPointReduction,
function(X)
	local n,s,i,x;
	n:=Size(X);
	s:=Shuffle([1..n]);
	for i in s do
		x:=Set(X)[i];
		if IsWeakPoint(X,x) then
			Print("# Weak point reduction: ",x,"\n");
			return RemovePoint(X,x);
		fi;
	od;
	Print("# No weak points.\n");
	return X;
end);


InstallGlobalFunction(RandomQCReduction,
function(X)
	local possible_qc,ab;
	possible_qc := Shuffle(Union(Combinations(MaximalElements(X),2), Combinations(MinimalElements(X),2)));
	for ab in possible_qc do
		if IsQCReduction(X,ab[1],ab[2]) then
			Print("# QC reduction: ", ab[1]," ",ab[2],"\n");
			return QuotientPoset(X,[ab[1],ab[2]]);
		fi;
	od;
	Print("# No QC reductions.\n");
	return X;
end);

InstallGlobalFunction(RandomMiddleReduction,
function(X)
	local mid,l;
	if Height(X)=2 then
		mid :=Shuffle(Filtered(Set(X), x-> not( x in MaximalElements(X) or x in MinimalElements(X)) ));
		for l in Combinations(mid,2) do
			if IsMiddleReduction(X,l[1],l[2]) then
				Print("# Middle reduction: ", l[1], " ",l[2],"\n");
				return QuotientPoset(X, l);
			fi;
		od;
		Print("# No middle reduction.\n");
		return X;
	else
		return X;
	fi;
end);

InstallGlobalFunction(RandomEdgeReduction,
function(X)
	local E,s,i,e;
	E:=CoveringRelations(X);
	s:=Shuffle([1..Size(E)]);
	for i in s do
		e:=E[i];
		if IsEdgeReduction(X, e) then
			Print("# Edge reduction: ", e,"\n");
			return RemoveCoveringRelation(X, e);
		fi;
	od;
	Print("# No edge reduction.\n");
	return X;
end);


InstallGlobalFunction(RandomOsakiReduction,
function(X)
	local n,dir,S,is,ws,els,d,i,x;
	n:=Size(X);
	dir:=Shuffle([1,2]);
	S:=Shuffle([1..n]);
	is:=[IsUpOsakiReduction,IsDownOsakiReduction];
	ws:=["Up","Down"];
	els:=[ElementsAbove,ElementsBelow];
	for d in dir do
		for i in S do
			x:=Set(X)[i];
			if is[d](X,x) then
				Print("# ", ws[d], " Osaki reduction: ", x, "\n");
				return QuotientPoset(X, Set(els[d](X,x)));
			fi;
		od;
	od; 
	Print("# No Osaki reduction.\n");
	return X;
end);


InstallGlobalFunction(RandomReductionCore,
function(X)
	local Y;
	if Size(X)=1 then
		Print("# The poset has size 1.\n");
		return X;
	fi;
	Y:=RandomReduction(X);
	if Y=X then
		return X;
	else
		return RandomReductionCore(Y);
	fi;
end);

InstallGlobalFunction(RandomReduction,
function(X)
	local available_reductions,i,Y;
	if Size(X)=1 then
		Print("# The poset has size 1.\n");
		return X;
	fi;
	available_reductions:=[
		RandomWeakPointReduction,
		RandomQCReduction,
		RandomMiddleReduction,
		RandomEdgeReduction,
		RandomOsakiReduction,
	];
	for i in Shuffle([1..Length(available_reductions)]) do
		Y := available_reductions[i](X);
		if Y <> X then
			return Y;
		fi;
	od;
	Print("# No more reductions.\n");
	return X;
end);

