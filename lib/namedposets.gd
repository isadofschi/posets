#! @Chapter Posets
#! @Section Examples of posets

#! @Arguments
#! @Description The empty poset.
#! @BeginExampleSession
#! gap> P:=EmptyPoset();
#! <finite poset of size 0>
#! @EndExampleSession
DeclareOperation("EmptyPoset",[]);

#! @Arguments n
#! @Description The minimal finite model of the $n$-sphere $S^n$ <Cite Key="BarmakBook" Where="Section 3.2"/>. 
#! @BeginExampleSession
#! gap> S1:=MinimalFiniteModelSphere(1);
#! <finite poset of size 4>
#! gap> S4:=MinimalFiniteModelSphere(4);
#! <finite poset of size 10>
#! @EndExampleSession
DeclareOperation("MinimalFiniteModelSphere",[IsInt]);


#! @Arguments 
#! @Description The wallet is a homotopically trivial poset on 11 points which is not contractible <Cite Key="BarmakBook" Where="Example 4.2.1"/>.
#! @BeginExampleSession
#! gap> W:=TheWallet();
#! <finite poset of size 11>
#! gap> Set(W);
#! [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 ]
#! gap> PosetHomology(W);
#! [ [ 0 ], [  ], [  ] ]
#! @EndExampleSession
DeclareOperation("TheWallet",[]);

