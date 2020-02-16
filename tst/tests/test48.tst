gap> W:=TheWallet(); 
<finite poset of size 11>
gap> F:=FreeGroup("x","y");;
gap> AssignGeneratorVariables(F);;
#I  Assigned the global variables [ x, y ]
gap> G:=F/[x^3,y^3,Comm(x,y)];;
gap> P:=PosetFpGroup(G);
<finite poset of size 50>
gap> M:=GreedySpanningMatching(P);;
