gap> X1:=PosetOfRadicalpSubgroups(AlternatingGroup(10),3);
<finite poset of size 24620>
gap> K:=OrderComplex(X1);;
gap> Size(K[1]);
24620
gap> Size(K[2]);
133000
gap> Size(K[3]);
151200
gap> Size(K[4]);
67200
gap> pi:=SCFundamentalGroup(K);
<fp group with 108381 generators>
gap> Length(RelatorsOfFpGroup(pi));
151200
gap> Sum(List(RelatorsOfFpGroup(pi),Length));
376350
gap> P:=PresentationFpGroup(pi);

