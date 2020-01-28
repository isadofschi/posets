#! @Chapter Homotopy theory

#! @Section Colorings

#! Colorings were introduced by Barmak and Minian in <Cite Key="BarmakMinianColorings"/>. Given $X$ a poset and $A$ an (appropriate) coloring of the Hasse diagram of $X$, they propose a technique to compute a presentation of the fundamental group of $X$ (see Theorem 4.4).
#!A $\textit{coloring}$ or $\textit{subdiagram}$  $A$ of $X$ is a subgraph of the Hasse diagram of $X$. $A$ has to satisfy some hypothesis to recover the fundamental group of $X$. For instance, $A$ could be a simple-connected diagram containing all the vertices of $X$. 

#!Using colorings, they give a presentation of the fundamental group of $X$ whose generators are the edges which are not in $A$ and the relators are given by the $\textit{digons}$. A  digon  in  a  poset $X$ is  a  subdiagram  which  is  the  union  of  two  different $\textit{monotonic}$ (or directed) edge-paths from a point $x$ to a point $y$ of $X$. 
  
#!In the presentation of the group it suffices to consider only the relations given by digons obtained as the union of edge-paths between minimal and maximal points. Moreover, for every pair of extremal points in $X$, we only consider digons composed by a preferred edge-path not completely encluded in $A$ and the rest of edge-paths.


#This  method  can  be  applied  to  compute  the  fundamental  group  of  any  regular finite CW-complex by means of its face poset.

#! @BeginGroup
#! @Description Computes a presentation of the fundamental group of  a poset <A> X</A>  using the coloring <A>A</A>.  <A>A</A> must be a simply-connected subdiagram of <A>X</A> . When <A>A</A> is not specified, its default value is a random spanning tree in <A>X<\A>. Returns a FpGroup isomorphic to $\pi_1(<A>X<\A>)$.
#! @BeginExampleSession
#! gap> W:=TheWallet();;
#! gap> FundamentalGroupByColoring(W);
#! <fp group on the generators [ f1, f2, f3, f4, f5, f6 ]>
#! gap> RelatorsOfFpGroup(G);
#! [ f2, f3, f4, f5*f3^-1, f1*f5*f4^-1, f1*f6 ]
#! gap> SimplifiedFpGroup(G);
#! <fp group on the generators [  ]>
#! gap> A:=SpanningCollapsible(W);;
#! gap> FundamentalGroupByColoring(W,A);
#! <fp group on the generators [  ]>
#! @EndExampleSession

#! @Arguments X
DeclareOperation("FundamentalGroupByColoring",[IsPoset]);
#! @Arguments X,A
DeclareOperation("FundamentalGroupByColoring",[IsPoset,IsList]);
#! @EndGroup


#! @Arguments X
#! @Description A spanning tree of the Hasse diagram of <A>X</A>.
DeclareOperation("SpanningForest",[IsPoset]);
#! @Arguments X
#! @Description A random spanning tree of the Hasse diagram of <A>X</A>.
DeclareOperation("RandomSpanningForest",[IsPoset]);


#! @Arguments X
#! @Description A spanning collapsible  subdiagram of the Hasse diagram of <A>X</A> which is maximal (i.e. any addition of a single edge in the subdiagram corresponds to a non-collapsible poset).
DeclareOperation("SpanningCollapsible",[IsPoset]);
#! @Arguments X
#! @Description A random maximal spanning collapsible subdiagram of the Hasse diagram of <A>X</A>.
DeclareOperation("RandomSpanningCollapsible",[IsPoset]);
