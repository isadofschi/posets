# Based on github.com/ximenafernandez/Finite-Spaces/Deformations.sage

# Osaki reductions:

InstallMethod(IsDownOsakiReduction,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	local IsContractibleOrEmpty;
	IsContractibleOrEmpty:= X -> IsContractible(X) or Size(X)=0;
	return Size(ElementsBelow(X,x))<> 1 and ForAll(Set(X), y-> IsContractibleOrEmpty(SubPoset(X,Intersection(Set(ElementsBelow(X,x)),Set(ElementsBelow(X,y))))));
end);

InstallMethod(IsUpOsakiReduction,
"for Poset, element",
[IsPoset, IsObject],
{X,x} -> IsDownOsakiReduction(OppositePoset(X),x)
#function(X,x)
#	local IsContractibleOrEmpty;
#	IsContractibleOrEmpty:= X -> IsContractible(X) or Size(X)=0;
#	return Size(ElementsAbove(X,x))<> 1 and ForAll(Set(X), y-> IsContractibleOrEmpty(SubPoset(X,Intersection(Set(ElementsAbove(X,x)),Set(ElementsAbove(X,y))))));
#end
);

InstallMethod(DownOsakiReduction,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	if IsDownOsakiReduction(X,x) then
		return QuotientPoset(X,Set(ElementsBelow(X,x)));
	else
		return fail;
	fi;
end);

InstallMethod(UpOsakiReduction,
"for Poset, element",
[IsPoset, IsObject],
function(X,x)
	if IsUpOsakiReduction(X,x) then
		return QuotientPoset(X,Set(ElementsAbove(X,x)));
	else
		return fail;
	fi;
end);

InstallMethod(DownOsakiCore,
"for Poset",
[IsPoset],
function(X)
	local x;
	if Size(X)=1 then
		return X;
	fi;
	for x in X do
		if IsDownOsakiReduction(X,x) then
			return DownOsakiCore(QuotientPoset(X,Set(ElementsBelow(X,x))));
		fi;
	od;
	return X;
end);

InstallMethod(UpOsakiCore,
"for Poset",
[IsPoset],
function(X)
	return OppositePoset(DownOsakiCore(OppositePoset(X)));
end);

#Middle reductions:
# See [Fernandez, Section 3.2.2]


InstallMethod(IsMiddleReduction,
"for Poset, point and point",
[IsPoset,IsObject,IsObject],
function(X, a, b)
	return
			(not a in MaximalElements(X))
		and (not b in MaximalElements(X))
		and (not a in MinimalElements(X))
		and (not b in MinimalElements(X))
		and Size(Intersection(Set(ElementsBelow(X,a)),Set(ElementsBelow(X,b))))=1
		and ForAll(Difference(Set(ElementsAbove(X,a)),Set(ElementsAbove(X,b))), x-> Size(Intersection(Set(ElementsBelow(X,b)),Set(ElementsBelow(X,x))))=1)
 		and ForAll(Difference(Set(ElementsAbove(X,b)),Set(ElementsAbove(X,a))), x-> Size(Intersection(Set(ElementsBelow(X,a)),Set(ElementsBelow(X,x))))=1);
end);

InstallMethod(IsMiddleOppositeReduction,
"for Poset, point and point",
[IsPoset,IsObject,IsObject],
function(X, a, b)
	return IsMiddleReduction(OppositePoset(X),a,b);
end);

InstallMethod(MiddleReduction,
"for Poset, point and point",
[IsPoset,IsObject,IsObject],
function(X, a, b)
	if IsMiddleReduction(X,a,b) or IsMiddleOppositeReduction(X,a,b) then
		return QuotientPoset(X,[a,b]);
	else
		return fail;
	fi;
end);


InstallMethod(MiddleReductionCore,
"for Poset",
[IsPoset],
function(X)
	local a,b;
	for a in X do
		for b in X do
			if a<>b then
				if IsMiddleReduction(X,a,b) or IsMiddleOppositeReduction(X,a,b) then
					return MiddleReductionCore(QuotientPoset(X,[a,b]));
				fi;
			fi;
		od;
	od;
	return X;
end);


#Edge reductions

InstallMethod(IsDownEdgeReduction,
"for Poset and edge",
[IsPoset,IsList],
function(X,e)
	return
				(e[2]  in MaximalElements(X))
			and (e in CoveringRelations(X))
			and IsContractible(RemoveCoveringRelation(ElementsBelow(X,e[2]),e));
end);

InstallMethod(IsUpEdgeReduction,
"for Poset and edge",
[IsPoset,IsList],
function(X,e)
	return
				(e[1]  in MinimalElements(X))
			and (e in CoveringRelations(X))
			and IsContractible(RemoveCoveringRelation(ElementsAbove(X,e[1]),e));
end);

InstallMethod(IsEdgeReduction,
"for Poset and edge",
[IsPoset,IsList],
function(X,e)
	return IsDownEdgeReduction(X,e) or IsUpEdgeReduction(X,e);
end);

InstallMethod(EdgeReduction,
"for Poset and edge",
[IsPoset,IsList],
function(X,e)
	if IsEdgeReduction(X,e) then
		return RemoveCoveringRelation(X, e);
	else
		return fail;
	fi;
end);


InstallMethod(EdgeReductionCore,
"for Poset",
[IsPoset],
function(X)
	local e;
	for e in CoveringRelations(X) do
		if IsEdgeReduction(X,e) then
			return EdgeReductionCore(RemoveCoveringRelation(X, e));
		fi;
	od;
	return X;
end);

#Random Reductions

# (not implemented yet)