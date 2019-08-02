#! @Chapter Posets
#! @Section Examples of posets

#! @Arguments
#! @Description The empty poset.
DeclareOperation("EmptyPoset",[]);

#! @Arguments n
#! @Description The minimal finite model of the $n$-sphere $S^n$ <Cite Key="BarmakBook" Where="Section 3.2"/>. 
DeclareOperation("MinimalFiniteModelSphere",[IsInt]);


#! @Arguments 
#! @Description The wallet is a homotopically trivial poset on 11 points which is not contractible <Cite Key="BarmakBook" Where="Example 4.2.1"/>.
DeclareOperation("TheWallet",[]);

