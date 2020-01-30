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
#! @Description The Wallet is a homotopically trivial poset on $11$ points which is not contractible <Cite Key="BarmakBook" Where="Example 4.2.1"/>.
#! <Alt Only="HTML">&lt;br/> &lt;img src="images/wallet.png" align="center" alt="The Wallet."/></Alt>
#! @BeginLatexOnly
#! \begin{figure}[H]
#! \centering
#! \includegraphics[scale=0.4]{images/wallet.png}
#! \caption{The wallet.}
#! \end{figure}
#! @EndLatexOnly
#! @BeginExampleSession
#! gap> W:=TheWallet();
#! <finite poset of size 11>
#! gap> Set(W);
#! [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 ]
#! gap> PosetHomology(W);
#! [ [ 0 ], [  ], [  ] ]
#! @EndExampleSession
DeclareOperation("TheWallet", []);


#! @Arguments 
#! @Description The Triangle is a poset on 19 points, see <Cite Key="FernandezThesis" Where="Example 2.2.7"/>.
#! <Alt Only="HTML">&lt;br/> &lt;img src="images/triangle.png" align="center" alt="The Triangle."/></Alt>
#! @BeginLatexOnly
#! \begin{figure}[H]
#! \centering
#! \includegraphics[scale=0.4]{images/triangle.png}
#! \caption{The Triangle.}
#! \end{figure}
#! @EndLatexOnly
#!
DeclareOperation("TheTriangle", []);


#! @Arguments 
#! @Description A finite model of the projective plane $\mathbb{R}P^2$ <Cite Key="BarmakBook" Where="Example 7.1.1"/>.
#! <Alt Only="HTML">&lt;br/> &lt;img src="images/RP2.png" align="center" alt="Finite model of the projective plane."/></Alt>
#! @BeginLatexOnly
#! \begin{figure}[H]
#! \centering
#! \includegraphics[scale=0.4]{images/RP2.png}
#! \caption{A finite model of $\mathbb{R}P^2$.}
#! \end{figure}
#! @EndLatexOnly
#! @BeginExampleSession
#! gap> RP2:=FiniteModelProjectivePlane();
#! <finite poset of size 13>
#! gap> FundamentalGroup(RP2);
#! #I  there are 1 generator and 1 relator of total length 2
#! <fp group on the generators [ f1 ]>
#! gap> Size(last);
#! 2
#! gap> PosetHomology(RP2);
#! [ [ 0 ], [ 2 ], [  ] ]
#! @EndExampleSession
DeclareOperation("FiniteModelProjectivePlane",[]);

