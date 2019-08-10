# Based on https://github.com/ximenafernandez/Finite-Spaces/blob/master/Morse.sage

OriginalAttaching:=function(G)
	# Attaching maps for the barycentric subdivision
	# of the presentation complex of an FpGroup G.
	# The output is a diccionary mapping each 2-cell
	# to an attaching map represented as a list of
	# pairs [edge,sign].
	local gens,rels, att,m,n,i,letters_r,r,len_r,j,l,s,s1,t,
	BasePoint,BarycenterOneCell,BarycenterTwoCell,OneCellGenerator,OneCellRelatorBasePoint,
	OneCellRelatorGenerator,TwoCellRelator;
	
	BasePoint:=[0,"b"];
	BarycenterOneCell:= i-> [1,"g",i];
	BarycenterTwoCell:= j -> [1,"r",j];
	OneCellGenerator := {i,s} -> [1,"gb",i,s]; # s is 1 or -1
	OneCellRelatorBasePoint:= {j,t} -> [1,"rb",j,t];
	OneCellRelatorGenerator:= {j,t} -> [1,"rg",j,t];
	TwoCellRelator:={j,t,s}-> [2,"r",j,t,s]; # s is 1 or -1

	gens:=GeneratorsOfGroup(FreeGroupOfFpGroup(G));
	rels:=RelatorsOfFpGroup(G);
	att := NewDictionary([],true);; #dictionary of attaching maps
	m:=Length(rels);
	n:=Length(gens);
	for j in [1..m] do
		r := rels[j];
		letters_r:=LetterRepAssocWord(r);
		len_r:=Length(r);
		for t in [1..Length(r)] do
			i:= AbsInt(letters_r[t]);
			s:= SignInt(letters_r[t]);
			for s1 in [-1,1] do
				AddDictionary(
					att,
					TwoCellRelator(j,t,s1),
					[
						[OneCellRelatorBasePoint(j,1+RemInt(t+(1-s1)/2-1,len_r)), 1],
						[OneCellRelatorGenerator(j,t), 1],
						[OneCellGenerator(i,s*s1),1]
					]
				);
			od;
		od;
	od;
	return att;
end;;

RewriteEdge := function(edge, replacements)
	# Recusively rewrites an edge following the 
	# rules given by replacements.
	local new_attaching, aux_rewrite;
	aux_rewrite := function(edge)
		local e;
		if LookupDictionary(replacements,edge)=fail then
			Add(new_attaching,edge);
		else
			for e in LookupDictionary(replacements,edge) do
				aux_rewrite(e);
			od;
		fi;
	end;;
	new_attaching := [];;
	aux_rewrite(edge);
	return new_attaching;
end;;

EdgeReplacementDictionary:=function(attaching, matching)
	# Returns a dictionary mapping each 
	# mapped 1-cell to its replacement.
	local replacements,pair,c1,c2,att,orient,pos,att_inv,w;
	replacements := NewDictionary([], true);
	for pair in matching do
		c1:=pair[2]; c2:=pair[1];
		w :=LookupDictionary(attaching,c2);;
		if w=fail then
			# dim(c2)=1 and c2 is not critical, thus the replacement is trivial:
			AddDictionary(replacements, [c2,1], []); 
			AddDictionary(replacements, [c2,-1], []);
		else
			# dim(c2)=2, we solve for c1:
			pos := Position(List(w, x->x[1]), c1);
			orient := w[pos][2];
			att := List(
				Concatenation([(pos+1)..Length(w)],[1..(pos-1)]),
				i -> [ w[i][1], -orient*w[i][2] ]
			);
			if orient=1 then
				att := Reversed(att);
			fi;
			Assert(0, Length(att)=Length(w)-1);
			AddDictionary(replacements, [c1,1], att);
			att_inv := Reversed(List(att, x-> [x[1],-x[2]]));
			AddDictionary(replacements, [c1,-1], att_inv);
		fi;
  	od;
	# for xx in (replacements!.entries) do Print(xx[1], " --> ", xx[2], "\n");od; # for debugging
	return replacements;
end;;


attaching_Morse:=function(attaching, matching, critics_dim_2)
	# Recibe:
	# attaching - diccionario - el attaching original
	# matching - lista - el matching dado como lista de pares de celdas
	# critics_dim_2 - lista - las celdas criticas de dim 2
	# Devuelve:	
	# attaching nuevo - diccionario
	local new_attaching,c,rel_c,replacements;
	replacements:=EdgeReplacementDictionary(attaching,matching);
	# Using replacements we compute the new attaching maps for the critical 2-cells:
	new_attaching := NewDictionary([],true);
	for c in critics_dim_2 do
		rel_c:=Concatenation(
					List(
						LookupDictionary(attaching,c),
						edge -> RewriteEdge(edge, replacements)
					)
				);
		AddDictionary(new_attaching,c,rel_c);
	od;
	return new_attaching;
end;;


CriticalCellsByLevel:=function(X, M)
	# X a poset (the face poset of a regular CW complex)
	# M an (acyclic) matching
	# returns the critical cells grouped by height
	local matched_cells,critical,x;
	matched_cells := Union(M);
	critical:=List([0..Height(X)], l->[]);
	for x in X do
		if not x in matched_cells then
			Add(critical[Height(X,x)+1],x);
		fi;
	od;
	return critical;
end;;

# Takes an FpGroup G and a matching M
InstallGlobalFunction(MorsePresentation,
function(G,M)
	local original_attaching,X,critical,morse_attaching,F,d,gens,i,rels,c,att_c,r;
	original_attaching := OriginalAttaching(G);
	X := PosetFpGroup(G);
	critical := CriticalCellsByLevel(X, M);
	morse_attaching := attaching_Morse(original_attaching, M, critical[3]);
	# los generadores de F son las 1-celdas criticas:
	F:=FreeGroup(Length(critical[2]));
	d:=NewDictionary([],true);
	gens:=GeneratorsOfGroup(F);
	for i in [1..Length(critical[2])] do
		AddDictionary(d,critical[2][i],gens[i]);
	od;
	# por cada 2-celda critica ponemos una relacion:
	rels:=[];
	for c in critical[3] do
		att_c := LookupDictionary(morse_attaching,c);
		r := Product(List(att_c, a -> LookupDictionary(d,a[1])^a[2]));
		Add(rels,r);
	od;
	return F/rels;
end);

InstallGlobalFunction(GreedyAcyclicMatching,
function(X)
	#Greedy algorithm that ouputs a random maximal matching (maximal if height X = 2).
	#X the face poset of regular CW.
	local n,edges,in_match,M,D,e;
	n:=Size(X);
	edges := List(CoveringRelations(X), e-> List(e,x->PositionSorted(Set(X),x)));
	in_match := List([1..n], ReturnFalse);
	Shuffle(edges);
	M := [];
	D := DigraphByEdges(edges);
	for e in edges do
		if in_match[e[1]] or in_match[e[2]] then
			continue;
		fi;
		D:=DigraphReverseEdge(D,e);
		if IsAcyclicDigraph(D) then
			Add(M,e);
			in_match[e[1]] := true;
			in_match[e[2]] := true;
		else
			D:=DigraphReverseEdge(D,Reversed(e));
		fi;
	od;
	return List(M, e-> List(e,v->Set(X)[v]));
end);

InstallGlobalFunction(GreedySpanningMatching,
function(X)
	local M;
	M:=[];
	while Length(CriticalCellsByLevel(X, M)[1]) <> 1 do
		M := GreedyAcyclicMatching(X);
	od;
	return M;
end);


#Ouputs the reversed Hasse diagram of X according to M
#def reverse(X, M): #X the face poset of a regular CW, M an acyclic matching
#	edges = X.cover_relations()
#	for e in M:
#		print e
#		edges.remove(list(e))
#		edges.append([e[1], e[0]])
#	return DiGraph(edges)

