# fundamental group by coloring (without spanning collapsible)

Kruskal:=function(X)
	# spanning forest
	local C,find,union,T,e;

	C := [1..Size(X)];
	find:=function(u)
		if C[u] <> u then
			C[u] := find(C[u]);
		fi;		
		return C[u];
	end;

	union:=function(u,v)
		u:=find(u);
		v:=find(v);
		C[u]:= v;
	end;

	T := [];

	for e in CoveringRelations(X) do # podemos permutar las coveringrelations si queremos un random spanning tree
		if find(PositionSorted(Set(X),e[1])) <> find(PositionSorted(Set(X),e[2])) then
			Add(T,e);
			union(PositionSorted(Set(X),e[1]), PositionSorted(Set(X),e[2]));
		fi;
	od;

	return T;
end;


expand:=function(X,A)
	local e;
	for e in  Difference(CoveringRelations(X),A) do
		if IsCollapsible( PosetByCoveringRelations( Set(X), Concatenation(A,[e]) ) ) then
			Add(A,e); # Is it okay to add these edges at once? Or shall we return A here?
		fi;
	od;
	return A;
end;

InstallMethod(SpanningCollapsibleSubDiagram,
"for Poset",
[IsPoset],
function(X)
	local A,n;
	A := Kruskal(X);
	n:=-1;
	while Size(A)>n do
		n := Size(A);
		A := expand(X,A);
	od;
	return A;
end);


InstallMethod(FundamentalGroupByColoring,
"for Poset, List",
[IsPoset,IsList],
function(X,A)
	local gens,F,rels,d,i,j,k,c1,chains_ij,maximal_chains,dfs_chains,x,to_covering_relations;

	# tests for A here?

	gens := Difference(CoveringRelations(X),A);
	F := FreeGroup(Size(gens));
	rels := [];

	d:=function(c) # maps a covering relation to an element of F
		if c in A then
			return Identity(F);
		else
			return GeneratorsOfGroup(F)[PositionSorted(gens,c)];
		fi;
	end;

	maximal_chains:=List([1..Size(MaximalElements(X))], x-> List([1..Size(MinimalElements(X))], y->[]));
	
	to_covering_relations:=function(xs)
		# chain represented as a list of vertices -> chain represented as a list of covering relations
		local n;
		n:=Size(xs);
		return List([1..n-1], i-> [xs[i],xs[i+1]]);
	end;

	dfs_chains:=function(xs)
		local n,x;
		n:=Size(xs);
		if LowerCovers(X,xs[n])=[] then
			# we found a maximal chain!
			Add(
				maximal_chains[PositionSorted(MaximalElements(X),xs[1])][PositionSorted(MinimalElements(X),xs[n])],
				to_covering_relations(xs)
			);
		else
			for x in LowerCovers(X,xs[n]) do
				dfs_chains(Concatenation(xs,[x]));
			od;
		fi;
	end;
	for x in MaximalElements(X) do
		dfs_chains([x]);
	od;
	#Print(maximal_chains);
	for i in [1..Size(MaximalElements(X))] do
		for j in [1..Size(MinimalElements(X))] do
			chains_ij:=maximal_chains[i][j];
			if Size(chains_ij)>1 then
				c1:=Product(List(chains_ij[1], d));
				for k in [2..Size(chains_ij)] do
					Add(rels, Product(List(chains_ij[k], d))*c1^-1);
				od;
			fi;
		od;
	od;
	return F/rels;
end);


InstallMethod(FundamentalGroupByColoring,
"for Poset",
[IsPoset],
function(X)
	return FundamentalGroupByColoring(X,Kruskal(X));
end);

