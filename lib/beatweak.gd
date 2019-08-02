#! @Chapter Classical stuff

#! @Section Elements above and below

#! @Arguments X,x
#! @Description The subposet $F_x=\{y\,:\, y \geq x\}$.
DeclareOperation("ElementsAbove",[IsPoset,IsObject]);

#! @Arguments X,x
#! @Description The subposet $\hat{F}_x=\{y\,:\, y &gt; x\}$.
DeclareOperation("ElementsStrictlyAbove",[IsPoset,IsObject]);

#! @Arguments X,x
#! @Description The subposet $U_x=\{y\,:\, y \leq x\}$.
DeclareOperation("ElementsBelow",[IsPoset,IsObject]);

#! @Arguments X,x
#! @Description The subposet $\hat{U}_x=\{y\,:\, y &lt; x\}$.
DeclareOperation("ElementsStrictlyBelow",[IsPoset,IsObject]);

#! @Arguments X,x
#! @Description The subposet given by the elements which are comparable to  $x$.
DeclareOperation("ElementsComparable",[IsPoset,IsObject]);

#! @Arguments X,x
#! @Description The subposet given by the elements which are comparable to $x$ and different from $x$.
DeclareOperation("ElementsStrictlyComparable",[IsPoset,IsObject]);

###################################################################################

#! @Arguments X,x
#! @Description The subposet $X\setminus x$.
DeclareOperation("RemovePoint",[IsPoset,IsObject]);

#! @Arguments X,e
#! @Description The subposet obtained by removing the covering relation $e$ from the Hasse diagram of $X$.
DeclareOperation("RemoveCoveringRelation",[IsPoset,IsList]);

###################################################################################
#! @Chapter Homotopy theory

#! @Section Beat points and homotopy type

#! @Arguments X,x
DeclareOperation("IsBeatPoint",[IsPoset,IsObject]);

#! @Arguments X,x
DeclareOperation("IsUpBeatPoint",[IsPoset,IsObject]); 

#! @Arguments X,x
DeclareOperation("IsDownBeatPoint",[IsPoset,IsObject]); 

#! @Arguments X
DeclareAttribute("UpBeatPoints",IsPoset); 

#! @Arguments X
DeclareAttribute("DownBeatPoints",IsPoset); 

#! @Arguments X
DeclareAttribute("BeatPoints",IsPoset);

#! @Arguments X
#! @Description The core of $X$. The natural maps are the inclusion $i\colon \mathrm{core}(X) \to X$ and the retraction $r\colon X \to \mathrm{core}(X)$.
DeclareOperation("Core",[IsPoset]);

#! @Arguments X
DeclareAttribute("IsContractible",IsPoset);

#! @Arguments X,Y
#! @Returns a homotopy equivalence <M>X\to Y</M> or fail if $X$ and $Y$ are not homotopy equivalent.
DeclareOperation("HomotopyEquivalence",[IsPoset,IsPoset]);

###################################################################################

#! @Section Weak points and simple homotopy type

#! @Arguments X,x
DeclareOperation("IsWeakPoint",[IsPoset,IsObject]); 

#! @Arguments X,x
DeclareOperation("IsUpWeakPoint",[IsPoset,IsObject]); 

#! @Arguments X,x
DeclareOperation("IsDownWeakPoint",[IsPoset,IsObject]); 

#! @Arguments X
DeclareAttribute("WeakPoints",IsPoset);

#! @Arguments X
DeclareAttribute("UpWeakPoints",IsPoset); 

#! @Arguments X
DeclareAttribute("DownWeakPoints",IsPoset); 

#! @Arguments X
DeclareOperation("WeakCore",[IsPoset]);

#! @Arguments X
#! Not implemented!
DeclareOperation("MinWeakCore",[IsPoset]); #to do

#! @Arguments X
#! Not implemented!
DeclareAttribute("IsCollapsible",IsPoset); #to do

