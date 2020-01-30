#! @Chapter Posets

#! @Section Plotting posets

#! To produce plots, the functions in this section need the software graphviz (<URL>https://www.graphviz.org</URL>) to be installed.

#! @Arguments X,options
#! @Description Returns a string in the DOT language representing the Hasse diagram of the poset <A>X</A>. The parameter <A>options</A> allows to customize the plot.
DeclareGlobalFunction("DotCode");

#! @Arguments code,filename
#! @Description This function takes <A>code</A> in the DOT language and saves the plot at <A>filename</A>.
DeclareGlobalFunction("DotCodeToFile");

#! @Arguments X, filename
#! @Description This function plots the Hasse diagram of X using the command dot. The plot is displayed and stored at filename. Many file extensions are supported.
#! @BeginExampleSession
#! gap> W:=TheWallet();;
#! gap> PlotHasseDiagram(W,"wallet.pdf");
#! @EndExampleSession
DeclareGlobalFunction("PlotHasseDiagram");

#! @Arguments X,M filename
#! @Description This function plots a Morse matching using the command dot. The matched edges are reversed and colored red. The plot is displayed and stored at filename.
#! <Alt Only="HTML"> &lt;br/> &lt;img src="images/matching.png" align="center" width="1000" alt="A matching." class="center" /></Alt>
#! @BeginLatexOnly
#! \begin{figure}[H]
#! \centering
#! \includegraphics[scale=0.2]{images/matching.png}
#! \caption{A Morse matching.}
#! \end{figure}
#! @EndLatexOnly
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
