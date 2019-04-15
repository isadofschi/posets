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


#!
DeclareOperation("RemovePoint",[IsPoset,IsObject]);
#!
DeclareOperation("RemoveCoveringRelation",[IsPoset,IsList]); #to do

#!
DeclareOperation("IsBeatPoint",[IsPoset,IsObject]);
#!
DeclareOperation("IsUpBeatPoint",[IsPoset,IsObject]); #to do
#!
DeclareOperation("IsDownBeatPoint",[IsPoset,IsObject]); #to do
#!
DeclareOperation("UpBeatPoints",[IsPoset]); 
#!
DeclareOperation("DownBeatPoints",[IsPoset]); 
#!
DeclareOperation("BeatPoints",[IsPoset]);


# returns a core of X as a subspace NaturalMaps(CorePoset(X))
# gives an inclusion i:core(X) --> X
#!
DeclareOperation("CorePoset",[IsPoset]);
#!
DeclareOperation("IsContractible",[IsPoset]);
#!
DeclareOperation("IsWeakPoint",[IsPoset,IsObject]); #to do
#!
DeclareOperation("IsUpWeakPoint",[IsPoset,IsObject]); #to do
#!
DeclareOperation("IsDownWeakPoint",[IsPoset,IsObject]); #to do
#!
DeclareOperation("WeakPoints",[IsPoset]); #to do
#!
DeclareOperation("UpWeakPoints",[IsPoset]); #to do
#!
DeclareOperation("DownWeakPoints",[IsPoset]); #to do
#!
DeclareOperation("WeakCorePoset",[IsPoset]); #to do
#!
DeclareOperation("MinWeakCorePoset",[IsPoset]); #to do, que hace?
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


