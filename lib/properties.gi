# More properties

# we do not check source(f)=target(f)! In this way we can consider FixedPoints of an inclusion i:A-->X
InstallMethod(FixedPointsPosetHomomorphism,
"for PosetHomomorphism",
[IsPosetHomomorphism],
function(f)
	local X,Fixf;
	X:=SourceMap(f);
	Fixf := Filtered(Set(X), x-> x=ImageMap(f,x));
	return SubPoset(X,Fixf);
end);

InstallMethod(HasFixedPointProperty,
"for Poset",
[IsPoset],
function(X)
	local homXX;
	homXX:=Set(HomPosets(X,X));
	return ForAll( homXX, f -> Size(FixedPointsPosetHomomorphism(f)) > 0 );
end);

InstallMethod(Grading,
"for Poset",
[IsPoset],
function(X)
	local above,below,cs,c,grades,m,dfs,grading;
	cs:=CoveringRelations(X);
	above:=List(Set(X),x->[]);
	below:=List(Set(X),x->[]);
	cs := List(cs, e-> List(e, x->PositionSorted(Set(X),x)));
	for c in cs do
		Add(above[c[2]],c[1]);
		Add(below[c[1]],c[2]);
	od;
	grades:=List(Set(X),ReturnFalse);
	dfs:=function(i,grade)
		local j;
		grades[i]:=grade;
		for j in above[i] do
			if grades[j]=false then
				dfs(j,grade+1);
			fi;
		od;
		for j in below[i] do
			if grades[j]=false then
				dfs(j,grade-1);
			fi;
		od;
	end;;
	dfs(1,0);
	m:=Minimum(grades);
	grades:=List(grades, x->x-m);
	for c in cs do
		if grades[c[1]]<>grades[c[2]]+1 then
			return fail;
		fi;
	od;
	grading := x -> grades[PositionSorted(Set(X),x)];
	return grading;
end);

InstallMethod(Height,
"for Poset and element",
[IsPoset,IsObject],
function(X,x)
	local i,h,y;
	if not x in X then
		Print("error, x must be a point of X");
		return fail;
	fi;
	if not IsBound(X!.heights) then
		X!.heights:=List([1..Size(X)], x->-1);
	fi;
	i:=PositionSorted(Set(X),x);	
	if X!.heights[i] = -1 then
		h:=0;
		for y in X do
			if x<>y and Ordering(X)(x,y) then # if x > y (strictly)
				h:=Maximum(h,1+Height(X,y));
			fi;
		od;
		X!.heights[i]:=h;
	fi;
	return X!.heights[i];
end);


InstallMethod(Height,
"for Poset",
[IsPoset],
function(X)
	return Maximum(List(Set(X),x->Height(X,x)));
end);


InstallMethod(ChainsPoset,
"for Poset",
[IsPoset],
function(X)
	local n,i,j,chains,position,chain;
	n:=Size(X);
	# this part could be a separate function computing the representation of the poset given by the U^_x s
	X!.UHats:=List([1..n],x->[]);
	for i in [1..n] do
		for j in [1..n] do
			if i<>j and Ordering(X)(Set(X)[i],Set(X)[j]) then
				Add(X!.UHats[i],j);
			fi;
		od;
	od;

	chains:=[];
	for i in [1..n] do
		Add(chains,[Set(X)[i]]);
	od;
	position:=1;
	while position <= Length(chains) do
		chain:=chains[position];
		i:=PositionSorted(Set(X),chain[Length(chain)]);
		for j in X!.UHats[i] do
			Add(chains, Concatenation(chain,[Set(X)[j]]) );
		od;
		position:=position+1;
	od;
	return Set(chains);
end);


InstallMethod(MobiusMatrix,
"for Poset",
[IsPoset],
function(X)
	local M,n,mu,i,j;
	OrderMatrix(X);
	n:=Size(X);
	M:=List([1..n], x->List([1..n],y->fail));
	mu:=function(i,j)
		local k,t;#,x,y,z;
		if M[i][j]=fail then
			if i=j then
				M[i][j]:=1; # x=y
			else
				#x:=Set(X)[i]; y:=Set(X)[j];
				if OrderMatrix(X)[j][i] then # y>x (recall that Ordering(X) is >= )
					t:=0;
					for k in IndicesElementsAbove(X)[i] do
						#z:=Set(X)[k];
						if OrderMatrix(X)[j][k] and (k<>j) then
							t:=t-mu(i,k);
						fi;
					od;
					M[i][j]:=t;
				else # if we are here either x>y or (x and y are not comparable)
					M[i][j]:=0; 
				fi;
			fi;
		fi;
		return M[i][j];
	end;;
	for i in [1..n] do
		for j in [1..n] do
			mu(i,j);
		od;
	od;
	return M;
end);

InstallMethod(MobiusFunction,
"for Poset",
[IsPoset],
function(X)
	MobiusMatrix(X);
	return {x,y}-> MobiusMatrix(X)[PositionSorted(Set(X),x)][PositionSorted(Set(X),y)];
end);

InstallMethod(Magnitude,
"for Poset",
[IsPoset],
function(X)
        mu := MobiusMatrix(X);
        return Sum(List(Sum(List(mu))));
end);
