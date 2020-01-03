gap> ApG:=QuillenPoset(AlternatingGroup(6),2);
<finite poset of size 75>
gap> SpG:=BrownPoset(AlternatingGroup(6),2);
<finite poset of size 165>
gap> ApG = PosetOfElementaryAbelianpSubgroups(AlternatingGroup(6),2);
true
gap> SpG = PosetOfpSubgroups(AlternatingGroup(6),2);
true
gap> HomotopyEquivalence(ApG,SpG);
fail
gap> ElementaryAbelianpSubgroups(AlternatingGroup(5),2);
[ Group([ (1,3)(2,4) ]), Group([ (1,4)(2,3) ]), Group([ (1,2)(3,4) ]), Group([ (1,2)(3,5) ]), Group([ (1,5)(2,3) ]),
  Group([ (1,3)(2,5) ]), Group([ (2,5)(3,4) ]), Group([ (2,3)(4,5) ]), Group([ (2,4)(3,5) ]), Group([ (1,3)(4,5) ]),
  Group([ (1,5)(3,4) ]), Group([ (1,4)(3,5) ]), Group([ (1,4)(2,5) ]), Group([ (1,5)(2,4) ]), Group([ (1,2)(4,5) ]),
  Group([ (1,3)(2,4), (1,2)(3,4) ]), Group([ (1,5)(2,3), (1,2)(3,5) ]), Group([ (2,4)(3,5), (2,3)(4,5) ]),
  Group([ (1,5)(3,4), (1,3)(4,5) ]), Group([ (1,4)(2,5), (1,2)(4,5) ]) ]
gap> ElementaryAbelianpSubgroups(AlternatingGroup(5),2,1);
[ Group([ (1,3)(2,4) ]), Group([ (1,4)(2,3) ]), Group([ (1,2)(3,4) ]), Group([ (1,2)(3,5) ]), Group([ (1,5)(2,3) ]),
  Group([ (1,3)(2,5) ]), Group([ (2,5)(3,4) ]), Group([ (2,3)(4,5) ]), Group([ (2,4)(3,5) ]), Group([ (1,3)(4,5) ]),
  Group([ (1,5)(3,4) ]), Group([ (1,4)(3,5) ]), Group([ (1,4)(2,5) ]), Group([ (1,5)(2,4) ]), Group([ (1,2)(4,5) ]) ]
gap> RadicalpSubgroups(AlternatingGroup(5),2);
[ Group([ (1,3)(2,4), (1,2)(3,4) ]), Group([ (1,5)(2,3), (1,2)(3,5) ]), Group([ (2,4)(3,5), (2,3)(4,5) ]),
  Group([ (1,5)(3,4), (1,3)(4,5) ]), Group([ (1,4)(2,5), (1,2)(4,5) ]) ]
gap> List(last,Size);
[ 4, 4, 4, 4, 4 ]
gap> BpG:=BoucPoset(AlternatingGroup(6),2);
<finite poset of size 75>
gap> HomotopyEquivalence(SpG,BpG);
fail
gap> R:=RobinsonPoset(AlternatingGroup(6),2);
<finite poset of size 615>
gap> IsContractible(R);
false
gap> G:=SmallGroup(72,40);
<pc group of size 72 with 5 generators>
gap> B:=OrbitSubdivisionBoucPoset(G,2);
<finite poset of size 5>
gap> IsContractible(B);
true
gap> A:=OrbitSubdivisionQuillenPoset(G,2);
<finite poset of size 9>
gap> IsContractible(A);
true
gap> S:=OrbitSubdivisionBrownPoset(G,2);
<finite poset of size 23>
gap> IsContractible(S);
true
gap> S2:=OrbitSubdivisionBrownPoset(PSL(2,7),2);
<finite poset of size 19>
gap> IsContractible(S2);
false
gap> V:=GF(2)^4;
( GF(2)^4 )
gap> P:=PosetOfSubspaces(V);
<finite poset of size 67>
gap> MaximumPoset(P);
<vector space of dimension 4 over GF(2)>
gap> MinimumPoset(P);
<vector space of dimension 0 over GF(2)>
gap> Q:=PosetOfProperSubspaces(V);
<finite poset of size 65>
gap> PosetHomology(Q);
[ [ 0 ], [  ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ]
