# 9605096 ms (217928 ms GC) and 536GB allocated for test20.tst
gap> gg:=DirectProduct(AlternatingGroup(5),PSU(3,4));
<permutation group of size 3744000 with 4 generators>
gap> aut:=AutomorphismGroup(gg);;
gap> l:=Filtered(NormalSubgroups(aut), H -> Order(H)=2*Order(gg));
[ <group of size 7488000 with 6 generators>, <group of size 7488000 with 6 generators>, <group of size 7488000 with 6 generators> ]
gap> l:=List(l, H->Image(IsomorphismPermGroup(H)));;
gap> List(l,StructureDescription);
[ "PSU(3,4) : S5", "(PSU(3,4) : C2) x A5", "PSU(3,4) x S5" ]
gap> G:=l[1];
PSU(3,4) : S5
gap> BpG:=PosetOfRadicalpSubgroups(G,2);
<finite poset of size 34520>
gap> Height(BpG);
2
