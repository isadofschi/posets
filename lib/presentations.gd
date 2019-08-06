#! @Chapter Constructing new posets
#! @Section The poset associated to a group presentation

#! @BeginGroup

#! @Description Returns the poset associated to an <C>FpGroup</C> or group presentation (see <Cite Key="FernandezThesis" Where="Definition 6.1.1"/>).

#! @Arguments G
DeclareOperation("PosetFpGroup",[IsFpGroup]);

#! @Arguments P
DeclareOperation("PosetPresentation",[IsPresentation]);

#! @EndGroup
