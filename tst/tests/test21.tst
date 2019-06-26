gap> G:=PSL(3,2);
Group([ (4,6)(5,7), (1,2,4)(3,6,5) ])
gap> ApG:=PosetOfElementaryAbelianpSubgroups(G,2);
<finite poset of size 35>
gap> BpG:=PosetOfRadicalpSubgroups(G,2);
<finite poset of size 35>
gap> MApG:=OrderMatrix(ApG);;
gap> MBpG:=OrderMatrix(BpG);;
gap> GraphFromAdyMat:= A -> Graph( Group(()), [1..Size(A)], OnPoints, {x,y}-> x<>y and (A[x][y] or A[y][x]), true );;
gap> gamma_A := GraphFromAdyMat(MApG);;
gap> gamma_B := GraphFromAdyMat(MBpG);;
gap> IsBipartite(gamma_A);
true
gap> IsBipartite(gamma_B);
true
gap> sigma:=GraphIsomorphism(gamma_A,gamma_B);
(1,2)(3,5,11,14,15,31,24,13,28,20,9,17,25,32,29,21,35,27,33,30,23,34,26,12,16,18,19,22,10,7,8,6,4)
gap> f:= PosetHomomorphismByImages(OppositePoset(ApG),BpG, List([1..35], i-> Set(BpG)[i^(sigma)]));
<order preserving map>
gap> g:= PosetHomomorphismByImages(BpG,OppositePoset(ApG), List([1..35], i-> Set(ApG)[i^(sigma^-1)]));
<order preserving map>
gap> CompositionPosetHomomorphisms(f,g)=IdentityMap(BpG);
true
gap> CompositionPosetHomomorphisms(g,f)=IdentityMap(OppositePoset(ApG));
true

