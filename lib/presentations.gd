#! @Chapter Posets and presentations
#! @Section The poset associated to a group presentation

#! @BeginGroup

#! @Description Returns the poset associated to a <C>FpGroup</C> or group presentation (see <Cite Key="FernandezThesis" Where="Definition 6.1.1"/>).

#! @Arguments G
#! @Description For a finitely presented group $G$, it returns a finite poset of height 2 whose fundamental group is $G$.
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
DeclareOperation("PosetFpGroup",[IsFpGroup]);

#! @Arguments P
#! @Description For a group presentation $\mathcal{P}$, it returns a finite poset of height 2 for which $\mathcal{P}$ is a presentation of its fundamental group.
#! @BeginExampleSession
#! gap> F:=FreeGroup("x");;
#! gap> AssignGeneratorVariables(F);;
#! #I  Assigned the global variables [ x ]
#! gap> G:=F/[x^2];;
#! gap> PosetPresentation(PresentationFpGroup(G));
#! <finite poset of size 13>
#! @EndExampleSession
DeclareOperation("PosetPresentation",[IsPresentation]);

#! @EndGroup
