#! @Chapter Constructing new posets
#! @Section The poset associated to a group presentation

#! @Arguments G
#! @Description Returns the finite space associated to the presentation given by the FpGroup G (see <Cite Key="FernandezThesis" Where="Definition 6.1.1"/>)
DeclareOperation("PosetFpGroup",[IsFpGroup]);

#! @Arguments P
#! @Description the finite space associated to the group presentation P (see <Cite Key="FernandezThesis" Where="Definition 6.1.1"/>)
DeclareOperation("PosetPresentation",[IsPresentation]);
