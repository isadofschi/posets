# Based on https://github.com/ximenafernandez/Finite-Spaces/blob/master/Morse.sage

#Morse 

OriginalAttaching:=function(G)
	local gens,rels, att,m,n,i,letters,r,j,l,e,
	BasePoint,CenterTwoCell,VertexOneCell,VertexBoundaryTwoCell;
	BasePoint := ["x",0]; # duplicated code!
	CenterTwoCell := r -> ["r",r,0];
	VertexOneCell := {g,i} -> ["x",g,i];
	VertexBoundaryTwoCell := {r,i} -> ["r",r,i];;

	gens:=GeneratorsOfGroup(FreeGroupOfFpGroup(G));
	rels:=RelatorsOfFpGroup(G);
	att := NewDictionary([],true);; #dictionary of attaching maps
	rels:=List(rels, r -> List(LetterRepAssocWord(r), x -> [AbsInt(x),SignInt(x)]) );
	m:=Length(rels);
	n:=Length(gens);
	for i in [1..m] do
		letters := List([1..n],x->0);
		r := rels[i];
		for j in [1..Length(r)] do
			l:= r[j][1];
			e:= r[j][2];
			letters[l]:=letters[l]+1;
			if e=1 then
				AddDictionary(
					att,
					VertexBoundaryTwoCell(i,4*(j-1)+2),
					[
						[VertexOneCell(l,1),1],
						[VertexBoundaryTwoCell(i,4*(j-1)+3), -1],
						[VertexBoundaryTwoCell(i,4*(j-1)+1),1]
					]
				);
				AddDictionary(
					att,
					VertexBoundaryTwoCell(i,4*(j-1)+4),
					[
						[VertexOneCell(l,-1),1],
						[VertexBoundaryTwoCell(i,RemInt(4*j+1,4*Length(r))), -1],
						[VertexBoundaryTwoCell(i,4*(j-1)+3), 1]
					]
				);
			else
				AddDictionary(
					att,	
					VertexBoundaryTwoCell(i,4*(j-1)+2),
					[
						[VertexOneCell(l,-1),-1],
						[VertexBoundaryTwoCell(i,4*(j-1)+3), -1],
						[VertexBoundaryTwoCell(i,4*(j-1)+1), 1]
					]
				);
				AddDictionary(
					att,
					VertexBoundaryTwoCell(i,4*(j-1)+4),
					[
						[VertexOneCell(l,1),-1],
						[VertexBoundaryTwoCell(i,RemInt(4*j+1,4*Length(r))),-1],
						[VertexBoundaryTwoCell(i,4*(j-1)+3), 1]
					]
				);
			fi;
		od;
	od;
	return att;
end;;


write := function(edge, isolate)
	# reescribe recursivamente una arista segun isolate
	# isolate dice como se reemplaza cada arista por una lista de aristas.
	local new_attaching, aux_write;
	aux_write := function(edge,isolate)
		local e;
		#Print("calling aux_write(",edge,",isolate)\n");
		if LookupDictionary(isolate,edge)=fail then
			Add(new_attaching,edge);
		else
			for e in LookupDictionary(isolate,edge) do
				aux_write(e, isolate);
			od;
		fi;
	end;;
	new_attaching := [];;
	aux_write(edge, isolate);
	return new_attaching;
end;;


get_isolate:=function(attaching, matching)
	# isolate es el diccionario que dice por que lista de aristas se reemplaza cada arista.
	local isolate,pair,c1,c2,att,orient,scell,cell,e,att_inv;
	isolate := NewDictionary([], true); # ojo, matching puede ser vacio?
	for pair in matching do
		c1:=pair[2]; c2:=pair[1]; # !!!!!!!!!!!!!!
		if LookupDictionary(attaching,c2)<>fail then # c2 of dimension 2
			att := []; # new attaching map of c2
			orient := 1;
			for scell in LookupDictionary(attaching,c2) do
				cell:=scell[1];;
				e:=scell[2];;
				if cell <> c1 then
					Add(att,[cell,-e]);
				else
					orient := e;
					break;
				fi;
			od;
			att := Reversed(att);;
			for scell in Reversed(LookupDictionary(attaching,c2)) do
				cell:=scell[1];
				e:=scell[2];
				if cell <> c1 then
					Add(att,[cell,-e]);
				else
					break;
				fi;
			od;
			if orient = -1 then
				att := Reversed(List(att, x-> [x[1],-x[2]]));
			fi;
			Assert(0,Length(att)=Length(LookupDictionary(attaching,c2))-1);
			AddDictionary(isolate,[c1,1],att);
			att_inv := Reversed(List(att, x-> [x[1],-x[2]]));
			AddDictionary(isolate,[c1,-1],att_inv);
		else
			# si es una 1-celda y no es critica la "tachamos"
			AddDictionary(isolate, [c2,1], []); 
			AddDictionary(isolate, [c2,-1], []);
		fi;
  	od;
	#for xx in (isolate!.entries) do Print(xx[1], " --> ", xx[2], "\n");od;
	return isolate;
end;;


attaching_Morse:=function(attaching, matching, critics_dim_2)
	# funcion principal!!!
	# Recibe:
	# attaching - diccionario - el attaching original
	# matching - lista - el matching dado como lista de pares de celdas
	# critics_dim_2 - lista - las celdas criticas de dim 2
	# Devuelve:	
	# attaching nuevo - diccionario
	local new_attaching,c,rel_c,isolate;
	isolate:=get_isolate(attaching,matching);
	# Usando isolate calculamos los attaching maps de las 2-celdas criticas:
	new_attaching := NewDictionary([],true); # ojo, critics_dim_2 puede ser vacio?
	for c in critics_dim_2 do
		rel_c:=Concatenation(
					List(
						LookupDictionary(attaching,c),
						edge -> write(edge, isolate)
					)
				);
		AddDictionary(new_attaching,c,rel_c);
	od;
	return new_attaching;
end;;


CriticalByLevel:=function(X, M)
	# X a poset
	# M an (acyclic) matching
	# devuelve la lista de celdas criticas agrupadas por altura.
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

DeclareGlobalFunction("MorsePresentation");
# Takes an FpGroup G and a matching M..
InstallGlobalFunction(MorsePresentation,
function(G,M)
	local original_attaching,X,critical,morse_attaching,F,d,gens,i,rels,c,att_c,r;
	original_attaching := OriginalAttaching(G);
	X := PosetFpGroup(G);
	critical := CriticalByLevel(X, M);
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


##########################################################################################
##########################################################################################
##########################################################################################

#Matchings

#Greedy algorithm that ouputs a random maximal matching (maximal if height X = 2).

GreedyAcyclicMatching:=function(X)
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
end;

GreedySpanningMatching:=function(X)
	local M;
	M:=[];
	while Length(CriticalByLevel(X, M)[1]) <> 1 do
		M := GreedyAcyclicMatching(X);
	od;
	return M;
end;

F:=FreeGroup("x","y");;AssignGeneratorVariables(F); G:=F/[x^3,y^3,Comm(x,y)];;
M:=GreedySpanningMatching(PosetFpGroup(G));
MorsePresentation(G,M);

#######################################
#######################################
#######################################

# Mas cosas:

#Incidence of critical cells

def critical_points(X, M): #X the face poset of a regular CW, M an acyclic matching
	L = X.list()
	for e in M:
		L.remove(e[0])
		L.remove(e[1])
	return L

#Ouputs the reversed Hasse diagram of X according to M
def reverse(X, M): #X the face poset of a regular CW, M an acyclic matching
	edges = X.cover_relations()
	for e in M:
		print e
		edges.remove(list(e))
		edges.append([e[1], e[0]])
	return DiGraph(edges)

#Ouputs the incidence of y in x in K_M
def critical_incidence(gens, rels, M, x, y): #X the face poset of a regular CW (say K), M an acyclic matching, y of height i, x of height i. 
	X = presentation_poset(gens,rels)
	incidence = attaching(gens,rels)
	D = reverse(X,M)
	L = D.all_simple_paths(starting_vertices = [x], ending_vertices = [y])
	inc = 0
	for p in L: 
		s = incidence(p[0], p[1])
		for i in range(2, len(p), 2):
			s = s * incidence(p[i], p[i-1]) * incidence(p[i], p[i])
			inc = inc + s * (-1)^(len(p)/2 - 1)
	return inc

def critical_CW_incidence(gens, rels, M): #X the face poset of a regular CW, M an acyclic matching
	X = presentation_poset(gens, rels)
	C = CriticalByLevel(X, M)
	inc = {}
	for i in range(len(C)-1):
		if C[i] != [] and C[i] != []:
			for y in C[i]:
				for x in C[i]:
					inc[(x, y)] = critical_incidence(gens, rels, M, x, y)
	return inc
