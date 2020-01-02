gap> A:=PosetByCoveringRelations([1,2,3,4], [[3,1],[3,2], [4,1],[4,2]]);
<finite poset of size 4>
gap> B:=PosetByCoveringRelations([1,2,3,4], [[4,2], [4,3], [2,1], [3,1]]);
<finite poset of size 4>
gap> f:=PosetHomomorphismByImages(A,B, [1, 2, 4, 4]);
<order preserving map>
gap> Zf:=MappingCylinderPosetHomomorphism(f);
<finite poset of size 8>
gap> HomotopyEquivalence(Zf,B);
<order preserving map>
gap> HomotopyEquivalence(Zf,A);
fail

