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
DeclareOperation("RemoveCoveringRelation",[IsPoset,IsList]);

###################################################################################
#! @Chapter Homotopy theory

#! @Section Beat points and homotopy type

#!
DeclareOperation("IsBeatPoint",[IsPoset,IsObject]);
#!
DeclareOperation("IsUpBeatPoint",[IsPoset,IsObject]); 
#!
DeclareOperation("IsDownBeatPoint",[IsPoset,IsObject]); 
#!
DeclareAttribute("UpBeatPoints",IsPoset); 
#!
DeclareAttribute("DownBeatPoints",IsPoset); 
#!
DeclareAttribute("BeatPoints",IsPoset);

#! @Arguments X
#! @Returns a core of X
#! @Description the natural maps are the inclusion i: core(X) --> X and the retraction r: X --> core(X)
DeclareOperation("Core",[IsPoset]);

#!
DeclareAttribute("IsContractible",IsPoset);

#! @Arguments X,Y
#! @Returns a homotopy equivalence <M>X\to Y</M> or fail if X and Y are not homotopy equivalent
DeclareOperation("HomotopyEquivalence",[IsPoset,IsPoset]);

###################################################################################

#! @Section Weak points and simple homotopy type

#!
DeclareOperation("IsWeakPoint",[IsPoset,IsObject]); 
#!
DeclareOperation("IsUpWeakPoint",[IsPoset,IsObject]); 
#!
DeclareOperation("IsDownWeakPoint",[IsPoset,IsObject]); 
#!
DeclareAttribute("WeakPoints",IsPoset);
#!
DeclareAttribute("UpWeakPoints",IsPoset); 
#!
DeclareAttribute("DownWeakPoints",IsPoset); 
#!
DeclareOperation("WeakCore",[IsPoset]);
#!
DeclareOperation("MinWeakCore",[IsPoset]); #to do, que hace?

#!
DeclareAttribute("IsCollapsible",IsPoset); #to do

###################################################################################
#! @Chapter More reductions

#! @Section QC Reductions

#!
DeclareOperation("IsQCReduction",[IsPoset,IsObject,IsObject]);
#!
DeclareOperation("IsQCopReduction",[IsPoset,IsObject,IsObject]);
#!
DeclareOperation("QCCore",[IsPoset]);

DeclareOperation("QCCores",[IsPoset]); #to do


