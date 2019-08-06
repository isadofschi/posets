#! @Chapter Homotopy theory

#! @Section Connectivity


#! @Arguments X,x,y
#! @Description A path from $x$ to $y$ in $X$ of the minimum possible length. Returns fail if $x$ and $y$ are not in the same connected component of $X$.
DeclareOperation("PathInPoset",[IsPoset,IsObject,IsObject]);

#! @Arguments X
#! @Description The connected components of $X$, given as a list of subposets.
DeclareOperation("ConnectedComponents",[IsPoset]);

#! @Section Fences and homotopies

#! Two maps $f,g\colon X\to Y$ are homotopic if and only if they are in the same connected component of $Y^X$ which is equivalent to the existence of a <E>fence</E> $f=h_0\leq h_1 \geq h_2\leq \cdots \geq h_n=g$, see <Cite Key="BarmakBook" Where="Section 1.2"/>.

# A shortest fence
#! @Arguments f,g
#! @Description Given $f,g\colon X\to Y$, if $f$ and $g$ are homotopic returns a fence (a path in $Y^X$) between $f$ and $g$ of the minimum possible length.
DeclareOperation("Fence",[IsPosetHomomorphism,IsPosetHomomorphism]);

#! @Arguments f,g
#! @Description Given $f,g\colon X\to Y$, returns true if $f\simeq g$, false otherwise.
DeclareOperation("AreHomotopic",[IsPosetHomomorphism,IsPosetHomomorphism]);


