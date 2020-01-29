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

InstallMethod(TheTriangle,
"for ",
[],
function()
return PosetByCoveringRelations([0..18],
[ [16,8],[16,4],[16,5],
[12,3],[12,5],[12,6],
[14,3],[14,4],[14,7],
[15,11],[15,4],[15,7],
[13,3],[13,6],[13,9],
[17,8],[17,5],[17,10],
[18,11],[18,9],[18,10],
[3,2],[3,1],[8,2],[8,1],[11,2],[11,1],
[4,2],[4,0],[6,2],[6,0],[10,2],[10,0],
[5,1],[5,0],[7,1],[7,0],[9,1],[9,0] ]);
end);

InstallMethod(FiniteModelProjectivePlane,
"for ",
[],
function()
	#   1     2     3     4
	#   5  6  7     8  9  10
    #      11    12    13
	return PosetByCoveringRelations([1..13], [[1,5], [1,7], [1,9], [2,6], [2,7], [2,10],
											  [3,6], [3,8], [3,9], [4,5], [4,8], [4,10],
											  [5,11], [5,12], [6,11], [6,12], [7,11], [7,13],
											  [8,11], [8,13], [9,12], [9,13], [10,12], [10,13]]);
end);
