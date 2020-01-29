#! @Chapter More reductions
#! @Section Random reductions

#! @Arguments X
#! @Description Removes a random weak point, if there is any.
#! @BeginExampleSession
#! gap> A1:=RandomWeakPointReduction(TheWallet());
#! # Weak point reduction: 3
#! <finite poset of size 10>
#! gap> A2:=RandomWeakPointReduction(TheWallet());
#! # Weak point reduction: 3
#! <finite poset of size 10>
#! gap> A3:=RandomWeakPointReduction(TheWallet());
#! # Weak point reduction: 11
#! <finite poset of size 10>
#! gap> A1 = A2;
#! true
#! gap> A1 = A3;
#! false
#! gap> RandomWeakPointReduction(MinimalFiniteModelSphere(1));
#! # No weak points.
#! <finite poset of size 4>
#! @EndExampleSession
DeclareGlobalFunction("RandomWeakPointReduction");

#! @Arguments X
#! @Description Performs a random QC-reduction, if there is any. Recall that if $x,y\in X$ are two maximal elements such that $U_x\cup U_y$ is contractible, then there is a QC-reduction from $X$ to the quotient space $X/\{x,y\}$. See <Cite Key="FernandezThesis" Where="Definition 2.2.6"/>.
#! @BeginExampleSession
#! gap> MaximalElements(TheWallet());
#! [ 1, 2, 3, 4 ]
#! gap> RandomQCReduction(TheWallet());
#! # QC reduction: 1 3
#! <finite poset of size 10>
#! gap> RandomQCReduction(TheWallet());
#! # QC reduction: 3 4
#! <finite poset of size 10>
#! gap> RandomQCReduction(MinimalFiniteModelSphere(1));
#! # No QC reductions.
#! <finite poset of size 4>
#! @EndExampleSession
DeclareGlobalFunction("RandomQCReduction");

#! @Arguments X
#! @Description Performs a random middle-reduction, if there is any. Recall that if $x,y\in X$ are neither maximal nor minimal points such that $U_z\cap U_y = \{*\}$ for every $z\in F_x - F_y$ and $U_z\cap U_x = \{*\}$ for every $z\in F_y - F_x$, then there is a middle-reduction from $X$ to the quotient space $X/ \{x,y\}$. See <Cite Key="FernandezThesis" Where="Definition 3.2.5"/>.
#! @BeginExampleSession
#! gap> RandomMiddleReduction(TheWallet());
#! # Middle reduction: 5 6
#! <finite poset of size 10>
#! gap> RandomMiddleReduction(MinimalFiniteModelSphere(2));
#! # No middle reduction.
#! <finite poset of size 6>
#! @EndExampleSession
DeclareGlobalFunction("RandomMiddleReduction");

#! @Arguments X
#! @Description Performs a random edge-reduction, if there is any. Recall that if $e = (x\prec y)$ is an edge in the Hasse diagram of $X$, with $y$ a maximal element, and if $U_b - e$ (the poset obtained from $U_b$ by removing the covering relation $e$) is contractible, then there is an edge-reduction from $X$ to $X-e$. See <Cite Key="FernandezThesis" Where="Definition 3.2.10"/>.
#! @BeginExampleSession
#! gap> RandomEdgeReduction(TheWallet());
#! # Edge reduction: [ 7, 11 ]
#! <finite poset of size 11>
#! gap> RandomEdgeReduction(MinimalFiniteModelSphere(3));
#! # No edge reduction.
#! <finite poset of size 8>
#! @EndExampleSession
DeclareGlobalFunction("RandomEdgeReduction");

#! @Arguments X
#! @Description Performs a random Osaki-reduction, if there is any. Recall that if $x_0\in X$ is an element such that $U_x\cap U_{x_0}$ is either empty or homotopically trivial for all $x\in X$, then there is a down Osaki-reduction from $X$ to $X/U_{x_0}$. Similarly, if $F_x\cap F_{x_0}$ is either empty or homotopically trivial for all $x\in X$ then there is an up Osaki-reduction. An Osaki-reduction is either an up or down Osaki-reduction.
#! @BeginExampleSession
#! gap> RandomOsakiReduction(TheWallet());
#! # Up Osaki reduction: 5
#! <finite poset of size 9>
#! gap> RandomOsakiReduction(FiniteModelProjectivePlane());
#! # No Osaki reduction.
#! <finite poset of size 13>
#! @EndExampleSession
DeclareGlobalFunction("RandomOsakiReduction");

#! @Arguments X
#! @Description Performs the random reductions described above until reaching a poset with no more reductions. It also shows the list of performed reductions.
#! @BeginExampleSession
#! gap> T:=TheTriangle();
#! <finite poset of size 19>
#! gap> WeakCore(T);
#! <finite poset of size 19>
#! gap> RandomReductionCore(T);
#! # No middle reduction.
#! # No weak points.
#! # No Osaki reduction.
#! # No edge reduction.
#! # QC reduction: 16 17
#! # Middle reduction: 5 11
#! # QC reduction: 13 14
#! # QC reduction: 13 16
#! # Edge reduction: [ 8, 2 ]
#! # Middle reduction: 4 10
#! # Down Osaki reduction: 7
#! # Up Osaki reduction: 5
#! # Weak point reduction: 8
#! # QC reduction: 7 11
#! # Middle reduction: 4 7
#! # Middle reduction: 6 9
#! # Edge reduction: [ 3, 1 ]
#! # Weak point reduction: 5
#! # Up Osaki reduction: 5
#! # Weak point reduction: 4
#! # Down Osaki reduction: 3
#! # Weak point reduction: 1
#! # Up Osaki reduction: 2
#! # The poset has size 1.
#! <finite poset of size 1>
#! @EndExampleSession
DeclareGlobalFunction("RandomReductionCore");

#! @Arguments X
#! @Description Performs one of the reductions described above, chosen at random.
#! @BeginExampleSession
#! gap> RandomReduction(TheWallet());
#! # Weak point reduction: 3
#! <finite poset of size 10>
#! gap> RandomReduction(TheWallet());
#! # Edge reduction: [ 5, 9 ]
#! <finite poset of size 11>
#! @EndExampleSession
DeclareGlobalFunction("RandomReduction");

