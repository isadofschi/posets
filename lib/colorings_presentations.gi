InstallGlobalFunction(ColoringPresentation,
function(G, A)
	X:= PosetFpGroup(G);
	A:= PosetByCoveringRelations(Set(X), C)
	if IsCollapsible(PosetByCoveringRelations(Set(X), C)) then
		return FundamentalGroupByColoring(X,C);

	else
		return "coloring is not a spanning collapsible subdiagram";
	fi;
end);

