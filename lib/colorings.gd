#! @Chapter Homotopy theory

#! @Section Colorings

#! Colorings were introduced by Barmak and Minian in <Cite Key="BarmakMinianColorings"/>.


#! @BeginGroup
#! @Description Computes the fundamental group of $X$ using colorings. If the list <A>A</A> of covering relations of a spanning collapsible subdiagram of the Hasse diagram of $X$ is specified it may produce a simpler presentation.
#! @BeginExampleSession
#! gap> W:=TheWallet();;
#! gap> FundamentalGroupByColoring(W);
#! <fp group on the generators [ f1, f2, f3, f4, f5, f6 ]>
#! gap> A:=SpanningCollapsibleSubDiagram(W);;
#! gap> FundamentalGroupByColoring(W,A);
#! <fp group on the generators [  ]>
#! @EndExampleSession
#! @Arguments X
DeclareOperation("FundamentalGroupByColoring",[IsPoset]);
#! @Arguments X,A
DeclareOperation("FundamentalGroupByColoring",[IsPoset,IsList]);
#! @EndGroup

#! @Arguments X
#! @Description A random maximal spanning collapsible subdiagram of the Hasse diagram of <A>X</A>.
DeclareOperation("SpanningCollapsibleSubDiagram",[IsPoset]);
