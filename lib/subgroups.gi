LoadPackage("SONATA");


reduceConjClasses:=function(G,l)
	local reducedList, add, a, b;
	reducedList:=[];
	for a in l do
		if ForAll(reducedList, b-> not IsConjugate(G,a,b)) then
			Add(reducedList,a);
		fi;
	od;
	return reducedList;	
end;;



TransversalList:=function(G,normalizers)
	local i, j;
	return List([1..Size(normalizers)], i-> List(RightTransversal(G,normalizers[i]),j->CanonicalRightCosetElement(normalizers[i],j)));
end;;


PSubgroups:=function(G,p)
	local H, S, g, i, j ,k, l, x, y, SpS, SpG, transversals, numConjugacyClasses, pPower, powers, ElementList, normalizers;
	
	S:=SylowSubgroup(G,p);
	
	SpS:=SubgroupsSolvableGroup(S);
	SpS:=SpS{[2..Size(SpS)]};
	SpS:=Set(reduceConjClasses(G,SpS));
	
	numConjugacyClasses:=Size(SpS);
	normalizers:=List([1..Size(SpS)], i-> Normalizer(G,SpS[i]));
	transversals:=TransversalList(G,normalizers);
	
	pPower:=Size(Filtered(Factors(Size(G)), x-> x = p));
	powers:=[1..pPower];
	
	SpG:=[];
	
	for i in [1..numConjugacyClasses] do
		for g in transversals[i] do
			H:=SpS[i]^g;
			Add(SpG, H);
		od;
	od;
	
	ElementList:=List(powers, x-> []);
	
	for i in powers do
		ElementList[i]:=Set(Filtered(SpG, x->Size(x) = p^i));
	od;
	
	return [SpS, SpG, ElementList, normalizers, transversals, pPower];
end;;

MatrixByChains:=function(chains)
	local I, M, i, j, k, x, y;
	
	Sort(chains);
	
	M:=List(chains, x-> List([1..Size(chains)], y->0));
	for x in chains do
		j:=Position(chains, x);
		I:=Combinations([1..Size(x)]);
		for i in I do
			y:=x{i};
			if Size(y)>0 then
				k:=Position(chains,y);
				M[j][k]:=1;
			fi;
		od;
	od;

	return M;
end;;

CanonicalRightTransversal:= function(G,H)
	return List(RightTransversal(G,H),i->CanonicalRightCosetElement(H,i));
end;;

InstallMethod(PosetOfSubgroups,
"for Group",
[IsGroup and IsFinite],
function(G)
	# the ordering is >=
	local S;
	S:=Subgroups(G);
	return PosetByFunctionNC(S,IsSubgroup);
end);

InstallMethod(PosetOfpSubgroups,
"for Group, Integer",
[IsGroup and IsFinite,IsInt],
function(G,p)
	# the ordering is >=
	local SpG;
	if not IsPrime(p) then
		Error("p must be prime");
	fi;
	SpG:=PosetByFunctionNC(Filtered(Subgroups(G), H-> IsPGroup(H) and RemInt(Order(H),p)=0), IsSubgroup);
	SetGrading(SpG,H-> Log(Order(H),p)-1); # Sp(G) is a graded poset
	return SpG;
end);



InstallGlobalFunction(ElementaryAbelianpSubgroups, function(G,p,r...)
	local partialSubgroups, S, H, l, repElemAb, elemAb, g, i, normalizersElemAb, transversalsElemAb, numClasesConjugacion;

	S:=SylowSubgroup(G,p);
	if r<>[] then
		r:=r[1];
		partialSubgroups:=Filtered(SubgroupsSolvableGroup(S), l->IsElementaryAbelian(l) and Order(l) > 1 and Order(l) <= p^r);
	else
		partialSubgroups:=Filtered(SubgroupsSolvableGroup(S), l->IsElementaryAbelian(l) and Order(l) > 1);
	fi;
	
	repElemAb:=reduceConjClasses(G,partialSubgroups);
	
	numClasesConjugacion:=Size(repElemAb);
	normalizersElemAb:=List(repElemAb, H-> Normalizer(G,H));
	
	transversalsElemAb:=List(normalizersElemAb, N-> CanonicalRightTransversal(G,N));
	
	elemAb:=[];
	
	for i in  [1..numClasesConjugacion] do
		for g in transversalsElemAb[i] do
			H:=repElemAb[i]^g;
			Add(elemAb, H);
		od;
	od;
	
	return elemAb;
end);


InstallMethod(PosetOfElementaryAbelianpSubgroups,
"for Group, Integer",
[IsGroup and IsFinite,IsInt],
function(G,p)
	# the ordering is >=
	local ApG;
	if not IsPrime(p) then
		Error("p must be prime");
	fi;
	ApG:=PosetByFunctionNC(ElementaryAbelianpSubgroups(G,p) , IsSubgroup);
	SetGrading(ApG,H-> Log(Order(H),p)-1); # Ap(G) is a graded poset
	return ApG;
end);



InstallGlobalFunction(RadicalpSubgroups, function(G,p)
	local BpP, BpG, H, i, g, numClasesConjugacion, normalizers, transversals,
	radicalSubgroupsConjClasses;

	radicalSubgroupsConjClasses:=function(G,p)
		local S, subgroups, l;
		S:=SylowSubgroup(G,p);
		subgroups:=Set(Filtered(SubgroupsSolvableGroup(S), l-> Order(l) > 1));
		return Filtered(subgroups, l-> Size(l) = Size(PCore(Normalizer(G,l),p)));
	end;;

	BpP:=reduceConjClasses(G,radicalSubgroupsConjClasses(G,p));
	
	numClasesConjugacion:=Size(BpP);
	normalizers:=List(BpP, H-> Normalizer(G,H));
	
	transversals:=List(normalizers, N-> CanonicalRightTransversal(G,N));
	BpG:=[];
	
	for i in  [1..numClasesConjugacion] do
		for g in transversals[i] do
			H:=BpP[i]^g;
			Add(BpG, H);
		od;
	od;
	return BpG;
end);



InstallMethod(PosetOfRadicalpSubgroups,
"for Group, Integer",
[IsGroup and IsFinite,IsInt],
function(G,p)
	# the ordering is >=
	local S,Bp;
	if not IsPrime(p) then
		Error("p must be prime");
	fi;
	Bp:=RadicalpSubgroups(G,p);	
	#Bp:=Filtered(S, H-> IsPGroup(H) and RemInt(Order(H),p)=0 and Order(H)=Order(PCore(Normalizer(G,H),p)) );
	return PosetByFunctionNC(Bp,IsSubgroup);
end);

InstallMethod(BoucPoset,
"for Group, Integer",
[IsGroup and IsFinite, IsInt],
PosetOfRadicalpSubgroups
);

InstallMethod(RobinsonPoset,
"for Group, Integer",
[IsGroup and IsFinite, IsInt],
function(G,p)
	local SpG,chains;
	# possible optimization: we could compute only the required chains instead of filtering
	SpG:=PosetOfpSubgroups(G,p);
	chains:=ChainsPoset(SpG);
	return PosetByFunctionNC(Filtered(chains, c -> ForAll(c, H-> IsNormal(c[1],H))),IsSubset);
end);



InstallMethod(OrbitSubdivisionPosetOfRadicalpSubgroups,
"for Group, Integer",
[IsGroup and IsFinite,IsInt],
function(G,p)
	local representantes_subgrupos_G,representantes_subgrupos_S,pPower,S,representantes_F,ordenes_F,elementsG,normalizers_F,cosets_F,
		transversals_F,num_clases_conjugacion,
		subgrupos_S,codigos_subgrupos,puntos_F,subgrupos_propios,
		i,j,g,H,k,x,y,M,I,par,
		N,T,a,b,add,
		orden_F,cadenas,F_prima,
		orbitas_F_prima,grupo_par,accion_par,accion_cadena,numero_orbita,c,cc,c1,orbita_c, elements_S, orderPElements, calculados,U_x;
	
	#### Calculo de nuevo el Sylow y los elementos de orden p en el Sylow
	S:=SylowSubgroup(G,p);
	elements_S:=Set(S);
	
	#### Calculo radicales
	subgrupos_S:=Filtered(Subgroups(S), x->Order(x) = Order(PCore(Normalizer(G,x),p)) and (Order(x) > 1));
	Sort(subgrupos_S); # tarda
	
	representantes_F:=[];
	for a in subgrupos_S do
		add:=true;
		for b in representantes_F do
			if IsConjugate(G,a,b) then
				add:=false;
				break;
			fi;
		od;
		if add then
			Add(representantes_F,a);
		fi;
	od;
	
	num_clases_conjugacion:=Size(representantes_F);
	
	ordenes_F:=List(representantes_F, H-> LogInt(Order(H),p));

	pPower:=Maximum(ordenes_F);

	elementsG:=Set(G);
	
	normalizers_F:=List(representantes_F, H-> Normalizer(G,H));

	transversals_F:=List(normalizers_F, N-> CanonicalRightTransversal(G,N));

	codigos_subgrupos:=List(subgrupos_S,x->-2);

	puntos_F:=List([1..pPower], x->[]); # puntos de F, agrupados por orden


	for i in [1..num_clases_conjugacion] do
		k:=ordenes_F[i];
		for g in transversals_F[i] do
			H:=representantes_F[i]^g;
			if IsSubset( elements_S, Set(GeneratorsOfGroup(H))) then
				j:=PositionSorted(elementsG,g);
				Add(puntos_F[k], [i,j]);
				# el codigo [i,j] representa el grupo representantes_F[i]^elementsG[j]
			fi;
		od;
		Sort(puntos_F[k]);
	od;
	
	for k in [1..pPower] do
		for par in puntos_F[k] do
			i:=par[1];
			j:=par[2];
			g:=elementsG[j];
			H:=representantes_F[i]^g;
			codigos_subgrupos[PositionSorted(subgrupos_S,H)]:=[i,j];
		od;
	od;

	subgrupos_propios:=function( par )
		local i,j,k,subgrupos_par,x,auxList,repGroup;
		i:=par[1];j:=par[2];
		repGroup:=representantes_F[i]^elementsG[j];
		subgrupos_par:=Filtered(Subgroups(repGroup), x-> Order(x) < Order(repGroup) and x in subgrupos_S);
		auxList:=List(subgrupos_par, H-> codigos_subgrupos[PositionSorted(subgrupos_S,H)]);
		return Filtered(auxList,x->not(x=-2));	
	end;;

	orden_F:=List(puntos_F,l-> List(l, par -> subgrupos_propios(par)));

	cadenas:=function()
		local Q,t,cadena_parcial,ultimo_punto,i,j,k,pos,U_techito,par1;
		Q:=Filtered(Concatenation( List(puntos_F, l-> List(l,x->[x]))), x->Size(x)>0);
		t:=1;
		while t<= Size(Q) do
			cadena_parcial:=Q[t];
			ultimo_punto:=cadena_parcial[Size(cadena_parcial)];
			i:=ultimo_punto[1];j:=ultimo_punto[2];
			k:=ordenes_F[i];
			pos:=PositionSorted(puntos_F[k],ultimo_punto);
			U_techito:=orden_F[k][pos];
			for par1 in U_techito do
				Add(Q, Concatenation(cadena_parcial,[par1]));
			od;
			t:=t+1;
		od;
		return Q;
	end;;

	F_prima:=cadenas();
	Sort(F_prima);
	
	orbitas_F_prima:=[];

	grupo_par:=function(par)
		return representantes_F[par[1]]^(elementsG[par[2]]);
	end;;

	accion_par:=function(par,g)
		return codigos_subgrupos[PositionSorted(subgrupos_S,representantes_F[par[1]]^(elementsG[par[2]]*g))];
	end;;

	accion_cadena:=function(c,g)
		return List(c,par->accion_par(par,g));
	end;;

	numero_orbita:=List(F_prima,x->-1);
	
	for c in F_prima do
		if numero_orbita[PositionSorted(F_prima,c)]=-1 then
			orbita_c:=[];
			N:=Intersection(List(c, par-> Normalizer(G,grupo_par(par))));# el normalizador de la cadena
			T:=RightTransversal(G,N);
			for g in T do 
				if IsSubset( elements_S, Set(GeneratorsOfGroup(grupo_par(c[1])^g ))) then
					Add(orbita_c,accion_cadena(c,g));
				fi;
			od;
			orbita_c:=Set(orbita_c);

			Add(orbitas_F_prima, orbita_c);
			cc:=Size(orbitas_F_prima);
			for c1 in orbita_c do
				numero_orbita[PositionSorted(F_prima,c1)]:=cc;
			od;
		fi;
	od;

	M:=List([1..Size(orbitas_F_prima)], x-> List([1..Size(orbitas_F_prima)], x->0)); #adyacencia del poset F'/G
	for x in F_prima do
		I:=Combinations([1..Size(x)]);
		for i in I do
			y:=x{i};
			if Size(y)>0 then
				M[numero_orbita[PositionSorted(F_prima,x)]][numero_orbita[PositionSorted(F_prima,y)]]:=1;
			fi;
		od;
	od;
	
	return PosetByOrderMatrix(M);
end);

InstallMethod(OrbitSubdivisionPosetOfElementaryAbelianpSubgroups,
"for Group, Integer",
[IsGroup and IsFinite,IsInt],
function(G,p)
	local representantes_subgrupos_G,representantes_subgrupos_S,pRank,S,representantes_F,rangos_F,elementsG,normalizers_F,cosets_F,
			transversals_F,num_clases_conjugacion,
			subgrupos_S,codigos_subgrupos,puntos_F,subgrupos_propios,
			i,j,g,H,k,x,y,M,I,par,
			N,T,a,b,add,
			orden_F,cadenas,F_prima,
			orbitas_F_prima,grupo_par,accion_par,accion_cadena,numero_orbita,c,cc,c1,orbita_c, elements_S, orderPElements, calculados,U_x;
	
	
	S:=SylowSubgroup(G,p);
	elements_S:=Set(S);
	subgrupos_S:=Filtered(Subgroups(S), x->IsElementaryAbelian(x) and not (Order(x) = 1));
	Sort(subgrupos_S); # tarda
	
	####################
	
	representantes_F:=[];
	for a in subgrupos_S do
		add:=true;
		for b in representantes_F do
			if IsConjugate(G,a,b) then
				add:=false;
				break;
			fi;
		od;
		if add then
			Add(representantes_F,a);
		fi;
	od;
	
	num_clases_conjugacion:=Size(representantes_F);
	
	rangos_F:=List(representantes_F, H-> LogInt(Order(H),p));

	pRank:=Maximum(rangos_F);

	elementsG:=Set(G);# ya está ordenado.
	
	normalizers_F:=List(representantes_F, H-> Normalizer(G,H));

	transversals_F:=List(normalizers_F, N-> CanonicalRightTransversal(G,N));

	codigos_subgrupos:=List(subgrupos_S,x->-2);
	
	puntos_F:=List([1..pRank], x->[]); # puntos de F, agrupados por rango

	for i in  [1..num_clases_conjugacion] do
		k:=rangos_F[i];
		for g in transversals_F[i] do
			H:=representantes_F[i]^g;
			if IsSubset( elements_S, Set(GeneratorsOfGroup(H))) then
				j:=PositionSorted(elementsG,g);
				Add(puntos_F[k], [i,j]);
				# el codigo [i,j] representa el grupo representantes_F[i]^elementsG[j]
			fi;
		od;
		Sort(puntos_F[k]);
	od;
	
	####################

	for k in [1..pRank] do
		for par in puntos_F[k] do
			i:=par[1];
			j:=par[2];
			g:=elementsG[j];
			H:=representantes_F[i]^g;
			codigos_subgrupos[PositionSorted(subgrupos_S,H)]:=[i,j];
		od;
	od;

	subgrupos_propios:=function( par ) # lista de los codigos de los subgrupos de par
		local i,j,k,subgrupos_par,x;
		i:=par[1];j:=par[2];
		k:=rangos_F[i];#unused
		subgrupos_par:=Subgroups( representantes_F[i]^elementsG[j] );
		subgrupos_par:=subgrupos_par{[2..Size(subgrupos_par)-1]};
		return Filtered(List(subgrupos_par, H-> codigos_subgrupos[PositionSorted(subgrupos_S,H)]),x->not(x=-2));	
	end;;

	orden_F:=List(puntos_F,l-> List(l, par -> subgrupos_propios(par)));

	cadenas:=function()
		local Q,t,cadena_parcial,ultimo_punto,i,j,k,pos,U_techito,par1;
		Q:=Concatenation( List(puntos_F, l-> List(l,x->[x])));
		t:=1;
		while t<= Size(Q) do
			cadena_parcial:=Q[t];#Print(cadena_parcial,"\n");
			ultimo_punto:=cadena_parcial[Size(cadena_parcial)];
			i:=ultimo_punto[1];j:=ultimo_punto[2];
			k:=rangos_F[i];
			pos:=PositionSorted(puntos_F[k],ultimo_punto);
			U_techito:=orden_F[k][pos];
			for par1 in U_techito do
				Add(Q, Concatenation(cadena_parcial,[par1]));
			od;
			t:=t+1;
		od;
		return Q;
	end;;

	F_prima:=cadenas();
	Sort(F_prima);

	orbitas_F_prima:=[];

	grupo_par:=function(par)
		return representantes_F[par[1]]^(elementsG[par[2]]);
	end;;

	accion_par:=function(par,g)
		return codigos_subgrupos[PositionSorted(subgrupos_S,representantes_F[par[1]]^(elementsG[par[2]]*g))];
	end;;

	accion_cadena:=function(c,g)
		return List(c,par->accion_par(par,g));
	end;;

	numero_orbita:=List(F_prima,x->-1);
	
	for c in F_prima do
		if numero_orbita[PositionSorted(F_prima,c)]=-1 then
			orbita_c:=[];
			N:=Intersection(List(c, par-> Normalizer(G,grupo_par(par))));# el normalizador de la cadena
			T:=RightTransversal(G,N);
			for g in T do 
				if IsSubset( elements_S, Set(GeneratorsOfGroup(grupo_par(c[1])^g ))) then
					Add(orbita_c,accion_cadena(c,g));
				fi;
			od;
			orbita_c:=Set(orbita_c);

			Add(orbitas_F_prima, orbita_c);
			cc:=Size(orbitas_F_prima);
			for c1 in orbita_c do
				numero_orbita[PositionSorted(F_prima,c1)]:=cc;
			od;
		fi;
	od;

	M:=List([1..Size(orbitas_F_prima)], x-> List([1..Size(orbitas_F_prima)], x->0)); #adyacencia del poset F'/G
	for x in F_prima do
		I:=Combinations([1..Size(x)]);
		for i in I do
			y:=x{i};
			if Size(y)>0 then
				M[numero_orbita[PositionSorted(F_prima,x)]][numero_orbita[PositionSorted(F_prima,y)]]:=1;
			fi;
		od;
	od;
	return PosetByOrderMatrix(M);
end);


InstallMethod(OrbitSubdivisionPosetOfpSubgroups,
"for Group, Integer",
[IsGroup and IsFinite,IsInt],
function(G,p)
	local representantes_subgrupos_G,representantes_subgrupos_S,pPower,S,representantes_F,ordenes_F,elementsG,normalizers_F,cosets_F,
		transversals_F,num_clases_conjugacion,
		subgrupos_S,codigos_subgrupos,puntos_F,subgrupos_propios,
		i,j,g,H,k,x,y,M,I,par,
		N,T,a,b,add,
		orden_F,cadenas,F_prima,
		orbitas_F_prima,grupo_par,accion_par,accion_cadena,numero_orbita,c,cc,c1,orbita_c, elements_S, orderPElements, calculados,U_x;	
	
	#### Calculo de nuevo el Sylow y los elementos de orden p en el Sylow
	S:=SylowSubgroup(G,p);
	elements_S:=Set(S);
	
	#### Calculo radicales
	subgrupos_S:=Filtered(Subgroups(S), x->Order(x) > 1);
	Sort(subgrupos_S); # tarda
	
	representantes_F:=[];
	for a in subgrupos_S do
		add:=true;
		for b in representantes_F do
			if IsConjugate(G,a,b) then
				add:=false;
				break;
			fi;
		od;
		if add then
			Add(representantes_F,a);
		fi;
	od;
	
	num_clases_conjugacion:=Size(representantes_F);
	
	ordenes_F:=List(representantes_F, H-> LogInt(Order(H),p));

	pPower:=Maximum(ordenes_F);

	elementsG:=Set(G);
	
	normalizers_F:=List(representantes_F, H-> Normalizer(G,H));
	
	transversals_F:=List(normalizers_F, N-> CanonicalRightTransversal(G,N));

	codigos_subgrupos:=List(subgrupos_S,x->-2);

	puntos_F:=List([1..pPower], x->[]); # puntos de F, agrupados por orden


	for i in [1..num_clases_conjugacion] do
		k:=ordenes_F[i];
		for g in transversals_F[i] do
			H:=representantes_F[i]^g;
			if IsSubset( elements_S, Set(GeneratorsOfGroup(H))) then
				j:=PositionSorted(elementsG,g);
				Add(puntos_F[k], [i,j]);
				# el codigo [i,j] representa el grupo representantes_F[i]^elementsG[j]
			fi;
		od;
		Sort(puntos_F[k]);
	od;
	
	for k in [1..pPower] do
		for par in puntos_F[k] do
			i:=par[1];
			j:=par[2];
			g:=elementsG[j];
			H:=representantes_F[i]^g;
			codigos_subgrupos[PositionSorted(subgrupos_S,H)]:=[i,j];
		od;
	od;

	subgrupos_propios:=function( par )
		local i,j,k,subgrupos_par,x,auxList,repGroup;
		i:=par[1];j:=par[2];
		repGroup:=representantes_F[i]^elementsG[j];
		subgrupos_par:=Subgroups(repGroup);
		subgrupos_par:=subgrupos_par{[2..Size(subgrupos_par)-1]};
		auxList:=List(subgrupos_par, H-> codigos_subgrupos[PositionSorted(subgrupos_S,H)]);
		return Filtered(auxList,x->not(x=-2));	
	end;;

	orden_F:=List(puntos_F,l-> List(l, par -> subgrupos_propios(par)));

	cadenas:=function()
		local Q,t,cadena_parcial,ultimo_punto,i,j,k,pos,U_techito,par1;
		Q:=Filtered(Concatenation( List(puntos_F, l-> List(l,x->[x]))), x->Size(x)>0);
		t:=1;
		while t<= Size(Q) do
			cadena_parcial:=Q[t];
			ultimo_punto:=cadena_parcial[Size(cadena_parcial)];
			i:=ultimo_punto[1];j:=ultimo_punto[2];
			k:=ordenes_F[i];
			pos:=PositionSorted(puntos_F[k],ultimo_punto);
			U_techito:=orden_F[k][pos];
			for par1 in U_techito do
				Add(Q, Concatenation(cadena_parcial,[par1]));
			od;
			t:=t+1;
		od;
		return Q;
	end;;

	F_prima:=cadenas();
	Sort(F_prima);
	
	orbitas_F_prima:=[];

	grupo_par:=function(par)
		return representantes_F[par[1]]^(elementsG[par[2]]);
	end;;

	accion_par:=function(par,g)
		return codigos_subgrupos[PositionSorted(subgrupos_S,representantes_F[par[1]]^(elementsG[par[2]]*g))];
	end;;

	accion_cadena:=function(c,g)
		return List(c,par->accion_par(par,g));
	end;;

	numero_orbita:=List(F_prima,x->-1);
	
	for c in F_prima do
		if numero_orbita[PositionSorted(F_prima,c)]=-1 then
			orbita_c:=[];
			N:=Intersection(List(c, par-> Normalizer(G,grupo_par(par))));# el normalizador de la cadena
			T:=RightTransversal(G,N);
			for g in T do 
				if IsSubset( elements_S, Set(GeneratorsOfGroup(grupo_par(c[1])^g ))) then
					Add(orbita_c,accion_cadena(c,g));
				fi;
			od;
			orbita_c:=Set(orbita_c);

			Add(orbitas_F_prima, orbita_c);
			cc:=Size(orbitas_F_prima);
			for c1 in orbita_c do
				numero_orbita[PositionSorted(F_prima,c1)]:=cc;
			od;
		fi;
	od;

	M:=List([1..Size(orbitas_F_prima)], x-> List([1..Size(orbitas_F_prima)], x->0)); #adyacencia del poset F'/G
	for x in F_prima do
		I:=Combinations([1..Size(x)]);
		for i in I do
			y:=x{i};
			if Size(y)>0 then
				M[numero_orbita[PositionSorted(F_prima,x)]][numero_orbita[PositionSorted(F_prima,y)]]:=1;
			fi;
		od;
	od;
	return PosetByOrderMatrix(M);
end);


InstallMethod(PosetOfSubspaces,
"for finite vector space",
[IsVectorSpace and IsFinite],
function(V)
	# the ordering is >=
	local X;
	X:=PosetByFunctionNC(Set(Subspaces(V)),IsSubset);
	SetGrading(X, Dimension );
	return X;
end);

InstallMethod(PosetOfProperSubspaces,
"for finite vector space",
[IsVectorSpace and IsFinite],
function(V)
	# the ordering is >=
	local X;
	X:=PosetByFunctionNC(Difference(Set(Subspaces(V)),[Set(Subspaces(V,0))[1],V]),IsSubset);
	SetGrading(X, Dimension );
	return X;
end);
