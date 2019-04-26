gap> G:=Image(IsomorphismFpGroup(AlternatingGroup(6)));;
gap> X_G:=PosetFpGroup(G);
<finite poset of size 175>
gap> IsomorphismGroups(AlternatingGroup(6),FundamentalGroup(X_G));
#I  there are 2 generators and 4 relators of total length 38
[ (2,3)(4,5), (1,2,3,4)(5,6) ] -> [ f2^-1*f1^2*f2*f1^3*f2^2*f1^2*f2, 
  f1*f2*f1^3*f2^3*f1 ]
gap> IsomorphismGroups(G,FundamentalGroupByColoring(X_G));
gap> ForAll(CoveringRelations(X_G),c-> Grading(X_G)(c[1])=1+Grading(X_G)(c[2]));
true
gap> BeatPoints(X_G)
[]
gap> WeakPoints(X_G);
[  ]

