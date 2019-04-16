#! @Chapter Classical stuff

#! @Section Elements above and below

#!
DeclareOperation("ElementsAbove",[IsPoset,IsObject]);
#!
DeclareOperation("ElementsStrictlyAbove",[IsPoset,IsObject]);
#!
DeclareOperation("ElementsBelow",[IsPoset,IsObject]);
#!
DeclareOperation("ElementsStrictlyBelow",[IsPoset,IsObject]);
#!
DeclareOperation("ElementsComparable",[IsPoset,IsObject]);
#!
DeclareOperation("ElementsStrictlyComparable",[IsPoset,IsObject]);

###################################################################################

#!
DeclareOperation("RemovePoint",[IsPoset,IsObject]);
#!
DeclareOperation("RemoveCoveringRelation",[IsPoset,IsList]); #to do

###################################################################################

#!
DeclareOperation("IsBeatPoint",[IsPoset,IsObject]);
#!
DeclareOperation("IsUpBeatPoint",[IsPoset,IsObject]); 
#!
DeclareOperation("IsDownBeatPoint",[IsPoset,IsObject]); 
#!
DeclareOperation("UpBeatPoints",[IsPoset]); 
#!
DeclareOperation("DownBeatPoints",[IsPoset]); 
#!
DeclareOperation("BeatPoints",[IsPoset]);

#! @Arguments X
#! @Returns a core of X
#! @Description the natural maps are the inclusion i: core(X) --> X and the retraction r: X --> core(X)
DeclareOperation("CorePoset",[IsPoset]);

#!
DeclareOperation("IsContractible",[IsPoset]);

#! @Arguments X,Y
#! @Returns a homotopy equivalence <M>X\to Y</M> or fail if X and Y are not homotopy equivalent
DeclareOperation("HomotopyEquivalence",[IsPoset,IsPoset]);

###################################################################################

#!
DeclareOperation("IsWeakPoint",[IsPoset,IsObject]); 
#!
DeclareOperation("IsUpWeakPoint",[IsPoset,IsObject]); 
#!
DeclareOperation("IsDownWeakPoint",[IsPoset,IsObject]); 
#!
DeclareOperation("WeakPoints",[IsPoset]);
#!
DeclareOperation("UpWeakPoints",[IsPoset]); 
#!
DeclareOperation("DownWeakPoints",[IsPoset]); 
#!
DeclareOperation("WeakCorePoset",[IsPoset]); #to do
#!
DeclareOperation("MinWeakCorePoset",[IsPoset]); #to do, que hace?

###################################################################################

#!
DeclareOperation("IsCollapsible",[IsPoset]); #to do
#!
DeclareOperation("IsQCReduction",[IsPoset,IsObject,IsObject]); #to do
#!
DeclareOperation("IsQCopReduction",[IsPoset,IsObject,IsObject]); #to do
#!
DeclareOperation("QCCorePoset",[IsPoset]); #to do
#!
DeclareOperation("QCCoresPoset",[IsPoset]); #to do


