#! @Chapter Classical stuff

#! @Section Elements above and below

#! @Arguments X,x
#! @Description The subposet $F_x=\{y\,:\, y \geq x\}$.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3], [[3,1],[3,2]]);
#! <finite poset of size 3>
#! gap> ElementsAbove(P,1);
#! <finite poset of size 2>
#! gap> Set(last);
#! [ 1, 3 ]
#! @EndExampleSession
DeclareOperation("ElementsAbove",[IsPoset,IsObject]);

#! @Arguments X,x
#! @Description The subposet $\hat{F}_x=\{y\,:\, y &gt; x\}$.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3], [[3,1],[3,2]]);
#! <finite poset of size 3>
#! gap> Set(ElementsStrictlyAbove(P,1));
#! [ 3 ]
#! @EndExampleSession
DeclareOperation("ElementsStrictlyAbove",[IsPoset,IsObject]);

#! @Arguments X,x
#! @Description The subposet $U_x=\{y\,:\, y \leq x\}$.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3], [[3,1],[3,2]]);
#! <finite poset of size 3>
#! gap> Set(ElementsBelow(P,3));
#! [ 1, 2, 3 ]
#! @EndExampleSession
DeclareOperation("ElementsBelow",[IsPoset,IsObject]);

#! @Arguments X,x
#! @Description The subposet $\hat{U}_x=\{y\,:\, y &lt; x\}$.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3], [[3,1],[3,2]]);
#! <finite poset of size 3>
#! gap> ElementsStrictlyBelow(P,3);
#! <finite poset of size 2>
#! gap> Set(last);
#! [ 1, 2 ]
#! @EndExampleSession
DeclareOperation("ElementsStrictlyBelow",[IsPoset,IsObject]);

#! @Arguments X,x
#! @Description The subposet given by the elements which are comparable with $x$.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3], [[3,1],[3,2]]);
#! <finite poset of size 3>
#! gap> ElementsComparable(P,2);
#! <finite poset of size 2>
#! gap> Set(last);
#! [ 2, 3 ]
#! @EndExampleSession
DeclareOperation("ElementsComparable",[IsPoset,IsObject]);

#! @Arguments X,x
#! @Description The subposet given by the elements which are comparable with $x$ and different from $x$.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3], [[3,1],[3,2]]);
#! <finite poset of size 3>
#! gap> ElementsStrictlyComparable(P,3);
#! <finite poset of size 2>
#! gap> Set(last);
#! [ 1, 2 ]
#! @EndExampleSession
DeclareOperation("ElementsStrictlyComparable",[IsPoset,IsObject]);

###################################################################################

#! @Arguments X,x
#! @Description The subposet $X\setminus x$.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3], [[3,1],[3,2]]);
#! <finite poset of size 3>
#! gap> Q:=RemovePoint(P,3);
#! <finite poset of size 2>
#! gap> Set(Q);
#! [ 1, 2 ]
#! @EndExampleSession
DeclareOperation("RemovePoint",[IsPoset,IsObject]);

#! @Arguments X,e
#! @Description The subposet obtained by removing the covering relation $e$ from the Hasse diagram of $X$.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3], [[3,1],[3,2]]);
#! <finite poset of size 3>
#! gap> Q:=RemoveCoveringRelation(P,[3,1]);
#! <finite poset of size 3>
#! gap> CoveringRelations(Q);
#! [ [ 3, 2 ] ]
#! @EndExampleSession
DeclareOperation("RemoveCoveringRelation",[IsPoset,IsList]);

###################################################################################
#! @Chapter Homotopy theory

#! @Section Beat points and homotopy type
#! The main reference for this section is <Cite Key="BarmakBook" Where="Section 1.3"/>. We recall here some important facts and definitions.
#! We consider finite posets as finite topological spaces via the intrinsic topology where the open sets are the downsets. This topology is also known as the Alexandroff topology.
#! A point $x\in X$ is an <E>up beat point</E> if $\{y\,:\, y&gt; x\}$ has a minimum. A point $x\in X$ is a <E>down beat point</E> if $\{y\,:\, y&lt; x\}$ has a maximum. A point $x\in X$ is a <E>beat point</E> if it is either an up or a down beat point. A poset is <E>minimal</E> if it has no beat points. A <E>core</E> of a finite poset X is a strong deformation retract which is a minimal poset. The core of a poset is unique up to isomorphism. Moreover, any core of a poset can be reached by exctracting beat points. Two posets are homotopy equivalent if and only if their cores are isomorphic. A poset is contractible if its has only one point.
#! This method of removing beat points to describe the homotopy type of finite posets with the Alexandroff topology was developed by R.E. Stong.

#! @Arguments X,x
#! @Description Checks if $x$ is a beat point of $X$.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3], [[3,1],[3,2]]);
#! <finite poset of size 3>
#! gap> IsBeatPoint(P,3);
#! false
#! gap> IsBeatPoint(P,1);
#! true
#! @EndExampleSession
DeclareOperation("IsBeatPoint",[IsPoset,IsObject]);

#! @Arguments X,x
#! @Description Checks if $x$ is an up beat point of $X$.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3], [[3,1],[3,2]]);
#! <finite poset of size 3>
#! gap> IsUpBeatPoint(P,1);
#! true
#! @EndExampleSession
DeclareOperation("IsUpBeatPoint",[IsPoset,IsObject]); 

#! @Arguments X,x
#! @Description Checks if $x$ is a down beat point of $X$.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3], [[3,1],[3,2]]);
#! <finite poset of size 3>
#! gap> IsDownBeatPoint(P,1);
#! false
#! @EndExampleSession
DeclareOperation("IsDownBeatPoint",[IsPoset,IsObject]); 

#! @Arguments X
#! @Description Returns the list of all the up beat points of the poset.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3], [[3,1],[3,2]]);
#! <finite poset of size 3>
#! gap> UpBeatPoints(P);
#! [ 1, 2 ]
#! @EndExampleSession
DeclareAttribute("UpBeatPoints",IsPoset); 

#! @Arguments X
#! @Description Returns the list of all the down beat points of the poset.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3], [[3,1],[3,2]]);
#! <finite poset of size 3>
#! gap> DownBeatPoints(P);
#! [  ]
#! @EndExampleSession
DeclareAttribute("DownBeatPoints",IsPoset); 

#! @Arguments X
#! @Description Returns the list of all the beat points of the poset.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3], [[3,1],[3,2]]);
#! <finite poset of size 3>
#! gap> BeatPoints(P);
#! [ 1, 2 ]
#! @EndExampleSession
DeclareAttribute("BeatPoints",IsPoset);

#! @Arguments X
#! @Description Returns the core of $X$. It also computes the natural inclusion map $i\colon \mathrm{core}(X) \to X$ and a retraction $r\colon X \to \mathrm{core}(X)$.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3], [[3,1],[3,2]]);
#! <finite poset of size 3>
#! gap> Q:=Core(P);
#! <finite poset of size 1>
#! gap> N:=NaturalMaps(Q);
#! [ <order preserving map>, <order preserving map> ]
#! gap> SourceMap(inc) = Q;
#! true
#! gap> TargetMap(inc) = P;
#! true
#! @EndExampleSession
DeclareAttribute("Core",IsPoset);

#! @Arguments X
#! @Description Returns the core of $X$ by using multiple processor cores. It also computes the natural inclusion map and a retraction. Note: only works on Linux.
#! @BeginExampleSession
#! gap> G:=AlternatingGroup(8);
#! Alt( [ 1 .. 8 ] )
#! gap> ApG:=QuillenPoset(G,2);
#! <finite poset of size 2655>
#! gap> start:=Runtime();; Q:=Core(ApG);; Runtime()-start; 
#! 90996
#! gap> start:=Runtime();; R:=CoreParallel(ApG);; Runtime()-start;
#! # Remaining points: 1710
#! # Remaining points: 1010
#! 184
#! gap> Set(Q) = Set(R);
#! true
#! @EndExampleSession
DeclareAttribute("CoreParallel",IsPoset);

#! @Arguments X
#! @Description Checks if the finite poset is contractible.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3], [[3,1],[3,2]]);
#! <finite poset of size 3>
#! gap> IsContractible(P);
#! true
#! @EndExampleSession
DeclareAttribute("IsContractible",IsPoset);

#! @Arguments X,Y
#! @Description Returns a homotopy equivalence <M>X\to Y</M> or fail if $X$ and $Y$ are not homotopy equivalent.
#! @BeginExampleSession
#! gap> S:=PosetByCoveringRelations([1,2,3,4], [[3,1],[3,2],[4,1],[4,2]]);
#! <finite poset of size 4>
#! gap> S1:=MinimalFiniteModelSphere(1);
#! <finite poset of size 4>
#! gap> HomotopyEquivalence(S,S1);
#! <order preserving map>
#! gap> P:=PosetByCoveringRelations([1,2,3], [[3,1],[3,2]]);
#! <finite poset of size 3>
#! gap> HomotopyEquivalence(S,P);
#! fail
#! @EndExampleSession
DeclareOperation("HomotopyEquivalence",[IsPoset,IsPoset]);

###################################################################################

#! @Section Weak points and simple homotopy type
#! The reference for this section is <Cite Key="BarmakBook" Where="Section 4.2"/>. As before, we consider finite posets with the Alexandroff topology.
#! A point $x\in X$ is an <E>up weak point</E> if $\{y\,:\, y&gt; x\}$ is contractible. A point $x\in X$ is a <E>down weak point</E> if $\{y\,:\, y&lt; x\}$ is contractible. A point $x\in X$ is a <E>weak point</E> if it is either an up or a down weak point. A weak core for $X$ is a subposet of $X$ without weak poitns and obtained from $X$ by removing weak points. The poset $X$ is collapsible if it admits a weak core with only one point. The weak cores of a finite poset do not need to be unique up to isomorphism.

#! @Arguments X,x
#! @Description Checks if $x$ is a weak point of $X$.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3,4], [[2,1], [3,1], [4,2], [4,3]]);
#! <finite poset of size 4>
#! gap> IsWeakPoint(P,1);
#! true
#! gap> IsBeatPoint(P,1);
#! false
#! @EndExampleSession
DeclareOperation("IsWeakPoint",[IsPoset,IsObject]); 

#! @Arguments X,x
#! @Description Checks if $x$ is an weak point of $X$.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3,4], [[2,1], [3,1], [4,2], [4,3]]);
#! <finite poset of size 4>
#! gap> IsUpWeakPoint(P,1);
#! true
#! gap> IsUpBeatPoint(P,1);
#! false
#! @EndExampleSession
DeclareOperation("IsUpWeakPoint",[IsPoset,IsObject]); 

#! @Arguments X,x
#! @Description Checks if $x$ is a down weak point of $X$.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3,4], [[2,1], [3,1], [4,2], [4,3]]);
#! <finite poset of size 4>
#! gap> IsDownWeakPoint(P,4);
#! true
#! gap> IsBeatPoint(P,4);
#! false
#! @EndExampleSession
DeclareOperation("IsDownWeakPoint",[IsPoset,IsObject]); 

#! @Arguments X
#! @Description Return the list of all the weak points of the poset. 
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3,4], [[2,1], [3,1], [4,2], [4,3]]);
#! <finite poset of size 4>
#! gap> WeakPoints(P);
#! [ 1, 2, 3, 4 ]
#! @EndExampleSession
DeclareAttribute("WeakPoints",IsPoset);

#! @Arguments X
#! @Description Return the list of all the up weak points of the poset. 
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3,4], [[2,1], [3,1], [4,2], [4,3]]);
#! <finite poset of size 4>
#! gap> UpWeakPoints(P);
#! [ 1, 2, 3 ]
#! @EndExampleSession
DeclareAttribute("UpWeakPoints",IsPoset); 

#! @Arguments X
#! @Description Return the list of all the down weak points of the poset. 
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3,4], [[2,1], [3,1], [4,2], [4,3]]);
#! <finite poset of size 4>
#! gap> DownWeakPoints(P);
#! [ 2, 3, 4 ]
#! @EndExampleSession
DeclareAttribute("DownWeakPoints",IsPoset); 

#! @Arguments X
#! @Description A subposet of $X$ without weak points obtained from $X$ by removing weak points. Note that this subposet does not need to be unique up to isomorphism.
#! @BeginExampleSession
#! gap> P:=PosetByCoveringRelations([1,2,3,4], [[2,1], [3,1], [4,2], [4,3]]);
#! <finite poset of size 4>
#! gap> WeakCore(P);
#! <finite poset of size 1>
#! @EndExampleSession
DeclareOperation("WeakCore",[IsPoset]);

#! @Arguments X
#! @Arguments X
#! @Description Returns a weak core of the poset with the minimum possible size. Again, this subposet does not need to be unique up to isomorphism.
#! @BeginExampleSession
#! gap> W:=TheWallet();
#! <finite poset of size 11>
#! gap> MinWeakCore(W);
#! <finite poset of size 1>
#! @EndExampleSession
DeclareOperation("MinWeakCore",[IsPoset]);

#! @Arguments X
#! @Description Checks if the poset is collapsible. 
#! @BeginExampleSession
#! gap> W:=TheWallet();
#! <finite poset of size 11>
#! gap> IsCollapsible(W);
#! true
#! gap> IsCollapsible(MinimalFiniteModelSphere(2));
#! false
#! @EndExampleSession
DeclareAttribute("IsCollapsible",IsPoset);

