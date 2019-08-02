#! @Chapter More reductions
#! The reference for this chapter is <Cite Key="FernandezThesis"/>.


#! @Section Osaki reductions
#!
DeclareOperation( "IsDownOsakiReduction", [IsPoset,IsObject]);
#!
DeclareOperation( "IsUpOsakiReduction", [IsPoset,IsObject]);
#!
DeclareOperation( "DownOsakiReduction", [IsPoset,IsObject]);
#!
DeclareOperation( "UpOsakiReduction", [IsPoset,IsObject]);
#!
DeclareOperation("DownOsakiCore",[IsPoset]);
#!
DeclareOperation("UpOsakiCore",[IsPoset]);

#! @Section Middle reductions
#! See  <Cite Key="FernandezThesis" Where="Section 3.2.2"/>

# Why not UpMiddleReduction and DownMiddleReduction ?
#!
DeclareOperation("IsMiddleReduction",[IsPoset,IsObject,IsObject]);
#!
DeclareOperation("IsMiddleOppositeReduction",[IsPoset,IsObject,IsObject]);
#!
DeclareOperation("MiddleReduction",[IsPoset,IsObject,IsObject]);
#DeclareOperation("MiddleOppositeReduction",[IsPoset,IsObject,IsObject]); 
#!
DeclareOperation("MiddleReductionCore",[IsPoset]);


#! @Section Edge reductions
#!
DeclareOperation("IsDownEdgeReduction",[IsPoset,IsList]);
#!
DeclareOperation("IsUpEdgeReduction",[IsPoset,IsList]);
#!
DeclareOperation("IsEdgeReduction",[IsPoset,IsList]);
#!
DeclareOperation("EdgeReduction",[IsPoset,IsList]);
#!
DeclareOperation("EdgeReductionCore",[IsPoset]);

#! @Section Random reductions
#! Not implemented yet:
#!
DeclareOperation("RandomReductionCore",[IsPoset]);
#!
DeclareOperation("RandomReduction",[IsPoset,IsInt]);

