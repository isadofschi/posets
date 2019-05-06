InstallMethod(PathInPoset,
"for Poset, point, point",
[IsPoset,IsObject,IsObject],
function(X,x1,x2)
	local i1,i2,n,visited,q,pos,p,j,k;
	# if we are only interested in knowing if there is a path we can use the equivalence relation
	# TransitiveClosureBinaryRelation(SymmetricClosureBinaryRelation(RelationByPoset(X))
	if x1 in X and x2 in X then
		i1:=PositionSorted(Set(X),x1);
		i2:=PositionSorted(Set(X),x2);
		n:=Size(X);
		visited:=List([1..n],ReturnFalse);
		q:=[ [i1] ];
		visited[i1]:=true;
		pos:=1;
		while pos <= Size(q) do
			p:=q[pos];
			j:=p[Size(p)];
			if j=i2 then
				return List(p, t -> Set(X)[t] );
			fi;
			for k in [1..n] do
				if (not visited[k]) and (OrderMatrix(X)[j][k] or OrderMatrix(X)[k][j]) then
					Add(q,Concatenation(p,[k]));
					visited[k]:=true;
				fi;
			od;
			pos:=pos+1;
		od;
		return fail;
	else
		return fail;
	fi;
end);

InstallMethod(Fence,
"for PosetHomomorphism and PosetHomomorphism ",
[IsPosetHomomorphism,IsPosetHomomorphism],
function(f,g)
	local Z;
	if SourceMap(f)=SourceMap(g) and TargetMap(f)=TargetMap(g) then
		Z:=HomPosets(SourceMap(f),TargetMap(f));
		return PathInPoset(Z,f,g);
	else
		return fail;
	fi;
end);

InstallMethod(AreHomotopic,
"for PosetHomomorphism and PosetHomomorphism ",
[IsPosetHomomorphism,IsPosetHomomorphism],
function(f,g)
	return Fence(f,g)<>fail;
end);


InstallMethod(ConnectedComponents,
"for Poset ",
[IsPoset],
function(X)
	return List(EquivalenceClasses(TransitiveClosureBinaryRelation(SymmetricClosureBinaryRelation(RelationByPoset(X)))),c->SubPoset(X,Set(X){Set(c)}));
end);


