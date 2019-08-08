# PosetFpGroup
# based on github.com/ximenafernandez/Finite-Spaces/Presentations.sage





InstallMethod(PosetFpGroup,
"for FpGroup",
[IsFpGroup],
function(G)
	local F,R,gens,pointsWedge,pointsDisks,pointsX,coveringRelationsX, g,r,i,ls,l,s,XP,grading,
	BasePoint,CenterTwoCell,VertexOneCell,VertexBoundaryTwoCell;
	
	BasePoint := ["x",0];
	CenterTwoCell := r -> ["r",r,0];
	VertexOneCell := {g,i} -> ["x",g,i];
	VertexBoundaryTwoCell := {r,i} -> ["r",r,i];

	F:=FreeGroupOfFpGroup(G);
	R:=RelatorsOfFpGroup(G);
	gens:=GeneratorsOfGroup(F);	
	pointsWedge:=Union([BasePoint],Concatenation(List([1..Size(gens)], g -> List([-1,0,1], t-> VertexOneCell(g,t) ))));
	pointsDisks:=Union(List([1..Size(R)], r-> List([0..4*Length(R[r])], i -> VertexBoundaryTwoCell(r,i)   ) ) );
	pointsX:=Union(pointsWedge,pointsDisks);
	coveringRelationsX:=[];
	# covering relations for wedge
	for g in [1..Size(gens)] do
		Add(coveringRelationsX, [VertexOneCell(g, 1), VertexOneCell(g,0)]);
		Add(coveringRelationsX, [VertexOneCell(g,-1), VertexOneCell(g,0)]);
		Add(coveringRelationsX, [VertexOneCell(g, 1), BasePoint]);
		Add(coveringRelationsX, [VertexOneCell(g,-1), BasePoint]);
	od; 
	# covering relations for disks
	for r in [1..Size(R)] do
		for i in 2*[1..2*Length(R[r])] do
			Add(coveringRelationsX, [VertexBoundaryTwoCell(r,i),VertexBoundaryTwoCell(r,i-1)]);
			Add(coveringRelationsX, [VertexBoundaryTwoCell(r,i),VertexBoundaryTwoCell(r,RemInt(i+1,4*Length(R[r])))]);
			Add(coveringRelationsX, [VertexBoundaryTwoCell(r,i-1), VertexBoundaryTwoCell(r,0)]);
		od;
	od;
	# covering relations from the "attaching maps"
	for r in [1..Size(R)] do
		ls:=LetterRepAssocWord(R[r]);
		for i in [1..Length(ls)] do
			l:=ls[i];
			g:=AbsInt(l);
			s:=SignInt(l);
			Add(coveringRelationsX, [ VertexBoundaryTwoCell(r,4*(i-1)+1), BasePoint  		  ]);
			Add(coveringRelationsX, [ VertexBoundaryTwoCell(r,4*(i-1)+2), VertexOneCell(g,s)  ]);
			Add(coveringRelationsX, [ VertexBoundaryTwoCell(r,4*(i-1)+3), VertexOneCell(g,0)  ]);
			Add(coveringRelationsX, [ VertexBoundaryTwoCell(r,4*(i-1)+4), VertexOneCell(g,-s) ]);
		od;
	od;
	XP:=PosetByCoveringRelations(pointsX,coveringRelationsX);
	grading:=function(v)
		if v=BasePoint then return 0; fi;
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

