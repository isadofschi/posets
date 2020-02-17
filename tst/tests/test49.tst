gap> G:=Image(IsomorphismFpGroup(CyclicGroup(2)));
<fp group of size 2 on the generators [ F1 ]>
gap> P:=PresentationFpGroup(G);
<presentation with 1 gens and 1 rels of total length 2>
gap> X1:=PosetFpGroup(G);
<finite poset of size 13>
gap> X2:=PosetPresentation(P);
<finite poset of size 13>
gap> X1 = X2;
true
gap> pi:=FundamentalGroup(X1);
#I  there are 1 generator and 1 relator of total length 2
<fp group on the generators [ f1 ]>
gap> Size(pi);
2
