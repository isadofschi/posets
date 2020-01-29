#! @Chapter Posets and presentations

#! The reference for this chapter is <Cite Key="FernandezThesis"/>.

#! @Section Colorings for presentations

#! Colorings can be applied to obtain isomorphic presentations to a given finite group presentation. Moreover, under some hypthesis on the coloring, the resulting presentation is in the same AC-class of the given one.
#! Given finite group presentation $\mathcal{P}$, consider the presentation poset $X_{\mathcal{P}}$.

#! @Arguments G
#! @Description Takes an <C>FpGroup</C> <A>G</A> and returns an FpGroup in the same AC-class <A>G</A>.

DeclareGlobalFunction("ColoringPresentation");

