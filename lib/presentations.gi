# PosetFpGroup
# based on github.com/ximenafernandez/Finite-Spaces/Presentations.sage


InstallMethod(PosetFpGroup,
"for FpGroup",
[IsFpGroup],
function(G)
	local F,R,gens,pointsWedge,pointsDisks,pointsX,coveringRelationsX, g,r,i,ls,l,s,XP,grading;
	F:=FreeGroupOfFpGroup(G);
	R:=RelatorsOfFpGroup(G);
	gens:=GeneratorsOfGroup(F);	
	pointsWedge:=Union([["x",0]],Concatenation(List([1..Size(gens)], i -> [["x",i,-1],["x",i,0],["x",i,1]] )));
	pointsDisks:=Union(List([1..Size(R)], r-> List([0..4*Length(R[r])], i -> ["r",r,i]  ) ) );
	pointsX:=Union(pointsWedge,pointsDisks);
	coveringRelationsX:=[];
	# covering relations for wedge
	for g in [1..Size(gens)] do
		Add(coveringRelationsX, [["x",g,1],["x",g,0]]);
		Add(coveringRelationsX, [["x",g,-1],["x",g,0]]);
		Add(coveringRelationsX, [["x",g,1],["x",0]]);
		Add(coveringRelationsX, [["x",g,-1],["x",0]]);
	od;
	# covering relations for disks
	for r in [1..Size(R)] do
		for i in 2*[1..2*Length(R[r])] do
			Add(coveringRelationsX, [["r",r,i], ["r",r,i-1]]);
			Add(coveringRelationsX, [["r",r,i], ["r",r,RemInt(i+1,4*Length(R[r]))]] );
			Add(coveringRelationsX, [["r",r,i-1], ["r",r,0]] );
		od;
	od;
	# covering relations from the "attaching maps"
	for r in [1..Size(R)] do
		ls:=LetterRepAssocWord(R[r]);
		for i in [1..Length(ls)] do
			l:=ls[i];
			g:=AbsInt(l);
			s:=SignInt(l);
			Add(coveringRelationsX, [ ["r",r, 4*(i-1)+1], ["x",0]      ]);
			Add(coveringRelationsX, [ ["r",r,4*(i-1)+2], ["x",g,s]  ]);
			Add(coveringRelationsX, [ ["r",r,4*(i-1)+3], ["x",g,0]  ]);
			Add(coveringRelationsX, [ ["r",r,4*(i-1)+4], ["x",g,-s] ]);
		od;
	od;
	XP:=PosetByCoveringRelations(pointsX,coveringRelationsX);
	grading:=function(v)
		if v=["x",0] then return 0; fi;
		if v[1]="x" and v[3]=0 then return 0; fi;
		if v[1]="x" then return 1; fi;
		if v[3]=0 then return 0; fi;
		if RemInt(v[3],2)=1 then return 1; fi;
		return 2;
	end;
	SetGrading(XP,grading);
	return XP;
end);

InstallMethod(PosetPresentation,
"for Presentation",
[IsPresentation],
function(P)
	return PosetFpGroup(FpGroupPresentation(P));
end);

