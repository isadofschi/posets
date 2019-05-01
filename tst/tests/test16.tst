gap> S1:=PosetByCoveringRelations([1..4], [[1,3],[1,4],[2,3],[2,4]]);
<finite poset of size 4>
gap> f:=PosetHomomorphismByFunction(S1,S1, x->x);
<order preserving map>
gap> g:=PosetHomomorphismByFunction(S1,S1, x-> x^(1,2)(3,4));
<order preserving map>
gap> Fence(f,g);
fail
gap> Fence(g,f);
fail
gap> c1:=PosetHomomorphismByFunction(S1,S1, x-> 1);
<order preserving map>
gap> c2:=PosetHomomorphismByFunction(S1,S1, x-> 2);
<order preserving map>
gap> Fence(c1,c2);
[ <order preserving map>, <order preserving map>, <order preserving map> ]
gap> Z1:=HomPosets(S1,S1);
<finite poset of size 36>
gap> R:=TransitiveClosureBinaryRelation(SymmetricClosureBinaryRelation(RelationByPoset(Z1)));
<equivalence relation on <object> >
gap> EquivalenceClasses(R);
[ {1}, {11}, {12}, {17}, {18} ]
gap> PosetHomology(Z1,0);
[ 0, 0, 0, 0, 0 ]
