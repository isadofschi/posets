gap> G:=Image(IsomorphismFpGroup(AlternatingGroup(6)));;
gap> X_G:=PosetFpGroup(G);
<finite poset of size 175>
gap> pi1X_G :=FundamentalGroup(X_G);;
#I  there are 2 generators and 4 relators of total length 38
gap> Order(pi1X_G);
360
gap> IdGroup(pi1X_G)=IdGroup(AlternatingGroup(6));
true
gap> pi1_coloring := FundamentalGroupByColoring(X_G);
<fp group with 244 generators>
gap> Order(pi1_coloring);
360
gap> IdGroup(pi1_coloring)=IdGroup(AlternatingGroup(6));
true
gap> ForAll(CoveringRelations(X_G),c-> Grading(X_G)(c[1])=1+Grading(X_G)(c[2]));
true
gap> BeatPoints(X_G);
[  ]
gap> WeakPoints(X_G);
[  ]

