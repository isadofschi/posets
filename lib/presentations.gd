

#! @Chapter Posets and presentations

#! The reference for this chapter is <Cite Key="FernandezThesis"/>.

#! @Section The poset associated to a group presentation


#! @BeginGroup

#! @Description Returns the poset associated to a <C>FpGroup</C> or group presentation. It is defined as  the face poset of the barycentric subdivision of the standard complex associated to a finite group presentation.
#! The presentation poset has height 2 and its fundamental group is isomorphic to $G$.
#! For more details on this construction, see <Cite Key="FernandezThesis" Where="Definition 6.1.1"/>.

#! @Arguments G
#! @Description For a finitely presented group <A>G</A>, it returns a finite poset of height 2 whose fundamental group is isomorphic to <A>G</A>.
DeclareOperation("PosetFpGroup",[IsFpGroup]);

#! @Arguments P
DeclareOperation("PosetPresentation",[IsPresentation]);

#! @BeginExampleSession
#! gap> F:=FreeGroup("x");;
#! gap> AssignGeneratorVariables(F);;
#! #I  Assigned the global variables [ x ]
#! gap> G:=F/[x^2];;
#! gap> P:=PosetFpGroup(G);
#! <finite poset of size 13>
#! gap> pi1:=FundamentalGroup(P);
#! #I  there are 1 generator and 1 relator of total length 2
#! <fp group on the generators [ f1 ]>
#! gap> Size(pi1);
#! 2
#! @EndExampleSession
#! @EndGroup
