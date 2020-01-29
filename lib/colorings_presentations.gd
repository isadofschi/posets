#! @Chapter Posets and presentations

#! The reference for this chapter is <Cite Key="FernandezThesis"/>.

#! @Section Colorings for presentations

#! Colorings can be applied to obtain isomorphic presentations to a given finite group presentation. Moreover, under some hypothesis on the coloring, the resulting presentation is in the same AC-class of the given one. (see <Cite Key="FernandezThesis"/>)
#! Given finite group presentation $\mathcal{P}$, consider the associated poset $X_{\mathcal{P}}$.

#! @Arguments G, A
#! @Description Takes an <C>FpGroup</C> <A>G</A> and a spanning collapsible coloring <A>A</A> in and returns an <C>FpGroup</C> isomorphic to <A>G</A> given by the presentation associated to the coloring <A>A</A>.
DeclareGlobalFunction("ColoringPresentation");

