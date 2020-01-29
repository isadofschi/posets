#! @Chapter Posets

#! @Section Plotting posets

#! @Arguments X,use_names
#! @Description Returns a string in the DOT language representing the Hasse diagram of the poset.
DeclareGlobalFunction("DotCode");


DeclareGlobalFunction("DotCodeToFile");

#! @Arguments X, filename
#! @Description This function plots the Hasse diagram of X using the command dot. The plot is displayed and stored at filename. The software graphviz (<URL>https://www.graphviz.org</URL>) is needed.
#! @BeginExampleSession
#! gap> W:=TheWallet();;
#! gap> PlotHasseDiagram(W,"wallet.pdf");
#! @EndExampleSession
DeclareGlobalFunction("PlotHasseDiagram");

#! @Arguments X,M filename
#! @Description This function plots a Morse matching using the command dot. The matched edges are reversed and colored red. The plot is displayed and stored at filename. The software graphviz (<URL>https://www.graphviz.org</URL>) is needed.
#! <Alt Only="HTML">&lt;img src="images/matching.png" align="center" width="1000" alt="A matching."/></Alt>

#! @BeginExampleSession
#! gap> F:=FreeGroup("x","y");;
#! gap> AssignGeneratorVariables(F);;
#! gap> G:=F/[x^3,y^3,Comm(x,y)];;
#! gap> P:=PosetFpGroup(G);
#! <finite poset of size 50>
#! gap> M:=GreedySpanningMatching(P);;
#! gap> PlotMorseMatching(P,M,"matching.pdf");
#! @EndExampleSession
DeclareGlobalFunction("PlotMorseMatching");
