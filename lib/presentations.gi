# PosetFpGroup
# based on github.com/ximenafernandez/Finite-Spaces/Presentations.sage

InstallMethod(PosetFpGroup,
"for FpGroup",
[IsFpGroup],
function(G)
	local F,rels,gens,n,m,
	pointsX,coveringRelationsX,
	i,j,r,letters_r,len_r,t,s,s1,XP,grading,
	BasePoint,BarycenterOneCell,BarycenterTwoCell,OneCellGenerator,OneCellRelatorBasePoint,
	OneCellRelatorGenerator,TwoCellRelator;
	
	BasePoint:=[0,"b"];
	BarycenterOneCell:= i-> [0,"g",i];
	BarycenterTwoCell:= j -> [0,"r",j];
	OneCellGenerator := {i,s} -> [1,"gb",i,s]; # s is 1 or -1
	OneCellRelatorBasePoint:= {j,t} -> [1,"rb",j,t];
	OneCellRelatorGenerator:= {j,t} -> [1,"rg",j,t];
	TwoCellRelator:={j,t,s}-> [2,"r",j,t,s]; # s is 1 or -1


	F:=FreeGroupOfFpGroup(G);
	rels:=RelatorsOfFpGroup(G);
	gens:=GeneratorsOfGroup(F);
	n:=Size(gens);
	m:=Size(rels);

	pointsX:=Union(
		[BasePoint],
		List([1..n],BarycenterOneCell),
		List([1..m],BarycenterTwoCell),
		Union(List([1,-1],s->List([1..n],i->OneCellGenerator(i,s)))),
		Union(List([1..m],j->List([1..Length(rels[j])],t->OneCellRelatorBasePoint(j,t) ))),
		Union(List([1..m],j->List([1..Length(rels[j])],t->OneCellRelatorGenerator(j,t) ))),
		Union(List([1,-1],s->Union(List([1..m],j->List([1..Length(rels[j])],t->TwoCellRelator(j,t,s) )))))
	);
	coveringRelationsX:=[];
	for i in [1..n] do
		for s in [-1,1] do
			Add(coveringRelationsX, [OneCellGenerator(i,s), BasePoint]);
			Add(coveringRelationsX, [OneCellGenerator(i,s), BarycenterOneCell(i) ]);
		od;
	od;
	for j in [1..m] do
		r:=rels[j];
		len_r:= Length(r);
		letters_r:=LetterRepAssocWord(r);
		for t in [1..len_r] do
			i:=AbsInt(letters_r[t]);
			s:=SignInt(letters_r[t]);
			Add(coveringRelationsX, [OneCellRelatorBasePoint(j,t), BasePoint]);
			Add(coveringRelationsX, [OneCellRelatorBasePoint(j,t), BarycenterTwoCell(j)]);
			Add(coveringRelationsX, [OneCellRelatorGenerator(j,t), BarycenterTwoCell(j)]);
			Add(coveringRelationsX, [OneCellRelatorGenerator(j,t), BarycenterOneCell(i)]);
			for s1 in [-1,1] do
				Add(coveringRelationsX, [TwoCellRelator(j,t,s1), OneCellRelatorBasePoint(j,1+RemInt(t+(1-s1)/2-1,len_r))]);
				Add(coveringRelationsX, [TwoCellRelator(j,t,s1), OneCellRelatorGenerator(j,t)]);
				Add(coveringRelationsX, [TwoCellRelator(j,t,s1), OneCellGenerator(i,s*s1)]);
			od;

		od;
	od;
	#Print(pointsX);
	#Print(coveringRelationsX);
	XP:=PosetByCoveringRelations(pointsX,coveringRelationsX);
	SetGrading(XP,x->x[1]);
	return XP;
end);

InstallMethod(PosetPresentation,
"for Presentation",
[IsPresentation],
function(P)
	return PosetFpGroup(FpGroupPresentation(P));
end);

