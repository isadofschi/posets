#! @Chapter Posets and presentations

#! @Section Discrete Morse theory

# Takes an FpGroup G and a matching M
#! @Arguments G,M
#! @Description Takes an <C>FpGroup</C> <A>G</A> and an acyclic spanning matching in the poset <M>X</M> associated to <A>G</A>. Returns an FpGroup isomorphic to <A>G</A> given by the presentation associated to the <M>2</M>-complex obtained from <M>X</M> by collapsing cells according to <A>M</A>.
DeclareGlobalFunction("MorsePresentation");

DeclareGlobalFunction("GreedyAcyclicMatching");

#!
DeclareGlobalFunction("GreedySpanningMatching");

