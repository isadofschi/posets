#! @Chapter Homotopy theory

#! @Section Fences


#! @Arguments X,x,y
#! @Description A path from $x$ to $y$ in $X$ of the minimum possible length. Returns fail if $x$ and $y$ are not in the same connected component of $X$.
DeclareOperation("PathInPoset",[IsPoset,IsObject,IsObject]);

# A shortest fence
#! @Arguments f,g
#! @Description Given $f,g\colon X\to Y$, if $f$ and $g$ are homotopic returns a fence (a path in $Y^X$) between $f$ and $g$ of the minimum possible length.
DeclareOperation("Fence",[IsPosetHomomorphism,IsPosetHomomorphism]);

#! @Arguments f,g
#! @Description Given $f,g\colon X\to Y$, returns true if $f\simeq g$, false otherwise.
DeclareOperation("AreHomotopic",[IsPosetHomomorphism,IsPosetHomomorphism]);

#! @Arguments X
#! @Description The connected components of $X$, given as a list of subposets.
DeclareOperation("ConnectedComponents",[IsPoset]);

