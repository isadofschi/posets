#! @Chapter Posets and presentations



#! @Section Colorings for presentations

#! Colorings can be applied to obtain isomorphic presentations to a given finite group presentation. Moreover, under some hypothesis on the coloring, the resulting presentation is in the same AC-class of the given one. 
# Given finite group presentation $\mathcal{P}$, consider the associated poset $X_{\mathcal{P}}$.

#! @Arguments G, A
#! @Description Takes an <C>FpGroup</C> <A>G</A> and a simply-connected coloring <A>A</A>  in the poset <C>PosetFpGroup(G)</C> associated to <A>G</A> and returns an <C>FpGroup</C> isomorphic to <A>G</A>.
#! Moreover, if <A>A</A> is a spanning collapsible subdiagram of <C>PosetFpGroup(G)</C>, then the resulting presentation of <C>FpGroup</C> belongs to the same Andrews Curtis class as the presentation of <A>G</A>.
DeclareGlobalFunction("ColoringPresentation");

