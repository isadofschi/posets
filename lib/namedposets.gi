InstallMethod(EmptyPoset,
"for ",
[],
function()
	return PosetByFunctionNC([],ReturnTrue);
end);

InstallMethod(MinimalFiniteModelSphere,
"for Integer>=-1",
[IsInt],
function(n)
	if n<-1 then
		Error("n < -1");
	fi;
	return Join(List([1..n+1], X-> PosetByFunction(["x","y"], {x,y}-> x=y)));
end);

InstallMethod(TheWallet,
"for ",
[],
function()
	#   1     2    3      4
	#   5     6    7      8
    #      9    10    11
	return PosetByCoveringRelations([1..11], [[1,5],[1,6],[2,5],[2,7],[3,6],[3,8],[4,7],[4,8],
										      [5,9],[5,10],[6,9],[6,10],[7,10],[7,11],[8,10],[8,11]]);
end);
