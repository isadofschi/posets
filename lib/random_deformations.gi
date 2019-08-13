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
			Print("# Edge reduction: ", e);
			return RemoveCoveringRelation(X, e);
		fi;
	od;
	Print("# No edge reduction.\n");
	return X;
end);


InstallGlobalFunction(RandomOsakiReduction,
function(X)
	local s

end);


InstallGlobalFunction(RandomCore,
function(X)

def random_core(X):
	if len(X.list()) == 1:
		print 'The poset 3-deforms to a point'
		return X
	counter = range(7)
	shuffle(counter)
	for i in range(7):
		Y = random_reduction(X, counter[i])
		if X != Y:
			return random_core(Y)
	return X
end);

InstallGlobalFunction(RandomReduction,
function(X)
end);



