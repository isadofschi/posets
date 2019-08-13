#! @Chapter More reductions
#! The reference for this chapter is <Cite Key="FernandezThesis"/>.

#! @Section QC Reductions
#! What we call "down QC reduction" is usually called "QC Reduction". What we call "up QC reduction" is usually called "QC op reduction"

#! @Arguments X,x,y
DeclareOperation("IsDownQCReduction",[IsPoset,IsObject,IsObject]);

#! @Arguments X,x,y
DeclareOperation("IsUpQCReduction",[IsPoset,IsObject,IsObject]);

#! @Arguments X,x,y
DeclareOperation("IsQCReduction",[IsPoset,IsObject,IsObject]);

#! @Arguments X
DeclareOperation("QCCore",[IsPoset]);

#! @Description Not implemented
DeclareOperation("QCCores",[IsPoset]); #to do



#! @Section Osaki reductions

#! @Arguments X,x
DeclareOperation( "IsDownOsakiReduction", [IsPoset,IsObject]);

#! @Arguments X,x
DeclareOperation( "IsUpOsakiReduction", [IsPoset,IsObject]);

#! @Arguments X,x
DeclareOperation( "DownOsakiReduction", [IsPoset,IsObject]);

#! @Arguments X,x
DeclareOperation( "UpOsakiReduction", [IsPoset,IsObject]);

#! @Arguments X
DeclareOperation("DownOsakiCore",[IsPoset]);

#! @Arguments X
DeclareOperation("UpOsakiCore",[IsPoset]);

#! @Section Middle reductions
#! See  <Cite Key="FernandezThesis" Where="Section 3.2.2"/>

# Why not UpMiddleReduction and DownMiddleReduction ?

#!  @Arguments X,x,y
DeclareOperation("IsDownMiddleReduction",[IsPoset,IsObject,IsObject]);

#!  @Arguments X,x,y
DeclareOperation("IsUpMiddleReduction",[IsPoset,IsObject,IsObject]);

#! @Arguments X,x,y
DeclareOperation("IsMiddleReduction",[IsPoset,IsObject,IsObject]); 

#! @Arguments X,x,y
DeclareOperation("MiddleReduction",[IsPoset,IsObject,IsObject]); 

#!  @Arguments X
DeclareOperation("MiddleReductionCore",[IsPoset]);


#! @Section Edge reductions

#!  @Arguments X,e
DeclareOperation("IsDownEdgeReduction",[IsPoset,IsList]);

#!  @Arguments X,e
DeclareOperation("IsUpEdgeReduction",[IsPoset,IsList]);

#!  @Arguments X,e
DeclareOperation("IsEdgeReduction",[IsPoset,IsList]);

#!  @Arguments X,e
DeclareOperation("EdgeReduction",[IsPoset,IsList]);

#!  @Arguments X
DeclareOperation("EdgeReductionCore",[IsPoset]);

#! @Section Random reductions
#! Not implemented yet:

#! @Arguments X
DeclareOperation("RandomReductionCore",[IsPoset]);

#! @Arguments X,n
DeclareOperation("RandomReduction",[IsPoset,IsInt]);

