#! @Arguments G
#! @Returns the finite space associated to an FpGroup (see Fernandez, [Definition 6.1.1] )
#! @Description the poset obtained from the FpGroup G.
DeclareOperation("PosetFpGroup",[IsFpGroup]);

#! @Arguments P
#! @Returns the finite space associated to a group presentation (see Fernandez, [Definition 6.1.1] )
#! @Description the poset obtained from the FpGroup G.
DeclareOperation("PosetPresentation",[IsPresentation]);
