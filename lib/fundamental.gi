InstallGlobalFunction(SpanningTreeOfGraph,
function(V,E)
	local T,u,e,_cl,cl,join,i,j;
	V:=Set(V);
	# Union-Find
	_cl:=List(V, x -> -1 );
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
	if Size(V) <= 1 then
		return [];
	fi;
	u := 0;
	T:=[];
	for e in E do
		i:=PositionSorted(V,e[1]);
		j:=PositionSorted(V,e[2]);
		if not cl(i) = cl(j) then
			u:=u+1;
			Add(T,e);
			if u=Size(V)-1 then
				return T;
			fi;
			join(i, j);
		fi;
	od;
	return fail;;
end);

InstallGlobalFunction(EdgePathGroup,
function(vertices,edges,twoSimplices)
	local T,F,gens,rels,f,e;
	vertices:=Set(vertices);
	edges:=Set(List(edges, e-> Set(e)));
	T:=SpanningTreeOfGraph(vertices,edges);
	if T=fail then
		return fail;
	fi;
	F:=FreeGroup(Size(edges));
	gens:=GeneratorsOfGroup(F);
	rels:=[];
	for e in T do
		Add(rels, gens[PositionSorted(edges,e)] );
	od;
	for f in twoSimplices do
		Add(rels, gens[PositionSorted(edges,[f[1],f[2]])]*gens[PositionSorted(edges,[f[2],f[3]])]*gens[PositionSorted(edges,[f[1],f[3]])]^-1);
	od;
	return F/rels;
end);


InstallGlobalFunction(SizeThreeCliques,
function(vertices,edges)
	local n,ady,e,cliques,i,j,k,v,w1,w2;
	vertices:=Set(vertices);
	n :=Size(vertices);
	ady:=List([1..n], x -> [] );
	for e in edges do
		Add(ady[PositionSorted(vertices,e[1])],PositionSorted(vertices,e[2]));
		Add(ady[PositionSorted(vertices,e[2])],PositionSorted(vertices,e[1]));
	od;
	for i in [1..n] do
		ady[i]:=Set(ady[i]);
	od;
	cliques:=[];
	for v in [1..n] do
		k := Size(ady[v]);
		for i in [1..k] do
			w1:= ady[v][i];
			for j in [i+1..k] do
				w2:=ady[v][j];
				if w2 in ady[w1] then
					Add(cliques, Set([ vertices[v], vertices[w1], vertices[w2] ]));
				fi;
			od;
		od;
	od;
	return Set(cliques);
end);

InstallGlobalFunction(FundamentalGroupOfCliqueComplex,
function(vertices,edges)
	return EdgePathGroup(vertices, edges, SizeThreeCliques(vertices,edges));
end);

