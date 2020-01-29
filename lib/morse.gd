#! @Chapter Posets and presentations

#! @Section Discrete Morse theory for presentations

#! Discrete Morse Theory can be applied to obtain isomorphic presentations to a given finite group presentation. Moreover, under some hypothesis on the matching, the resulting presentation is in the same AC-class of the given one. 
#(see )
# Given finite group presentation $\mathcal{P}$, consider the associated poset $X_{\mathcal{P}}$.

# Takes an FpGroup G and a matching M
#! @Arguments G,M
#! @Description Takes an <C>FpGroup</C> <A>G</A> and an acyclic spanning matching with only one critical cell of dimensionvertex of height 0 in the poset <C>PosetFpGroup(G)</C> associated to <A>G</A>. Returns an FpGroup isomorphic to <A>G</A> given by the presentation associated to the <M>2</M>-complex obtained from <M>X</M> by collapsing cells according to <A>M</A>. Moreover, the resulting presentation belongs to the same Andrews-Curtis class than the presentation associated to <A>G</A>. 
DeclareGlobalFunction("MorsePresentation");

DeclareGlobalFunction("GreedyAcyclicMatching");

#! @Arguments X
#! @Description Tries to find a spanning matching for the poset <A>X</A>.
DeclareGlobalFunction("GreedySpanningMatching");

