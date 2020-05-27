gap> A:=PosetByCoveringRelations([1,2,3,4], [[3,1],[3,2], [4,1],[4,2]]);
<finite poset of size 4>
gap> B:=PosetByCoveringRelations([1,2],[]);
<finite poset of size 2>
gap> S:=SubPoset(A,[1,2]);
<finite poset of size 2>
gap> CoveringRelations(S);
[  ]
gap> C:=TheWallet();
<finite poset of size 11>
gap> Coproduct(A,B,C);
<finite poset of size 17>
gap> J:=Join(A,B,C);
<finite poset of size 17>
gap> a:=Set(J)[1];; b:=Set(J)[6];;
gap> Ordering(J)(b,a);
true
gap> W:=TheWallet();
<finite poset of size 11>
gap> MaximumPoset(W);
fail
gap> coneW:=ConePoset(W);
<finite poset of size 12>
gap> Size(MaximalElements(coneW));
1
gap> P:=EmptyPoset();
<finite poset of size 0>
gap> S1P:=SuspensionPoset(P);
<finite poset of size 2>
gap> IsomorphismPosets(S1P,MinimalFiniteModelSphere(0));
<order preserving map>
gap> S2P:=SuspensionPoset(S1P);
<finite poset of size 4>
gap> IsomorphismPosets(S2P,MinimalFiniteModelSphere(1));
<order preserving map>
gap> P:=PosetByCoveringRelations([1,2,3], [[3,1], [3,2]]);
<finite poset of size 3>
gap> Popposite:=OppositePoset(P);
<finite poset of size 3>
gap> IsomorphismPosets(P,Popposite);
fail

