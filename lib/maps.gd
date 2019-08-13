#! @Chapter Posets
#! @Section Homomorphisms

#! @Arguments X
#! @Description The identity $1_X\colon X\to X$.
DeclareAttribute("IdentityMap",IsPoset);

#! @BeginGroup Composition of homomorphisms
#! @Label Composition of homomorphisms
#! @Arguments f,g
#! @Description The composition $f\circ g$.
DeclareOperation("CompositionPosetHomomorphisms",[IsPosetHomomorphism,IsPosetHomomorphism]);
#!
DeclareOperation("\*",[IsPosetHomomorphism,IsPosetHomomorphism]);
#! @EndGroup

#! @Arguments f
#! @Description The source $X$ of a map $f\colon X\to Y$.
DeclareOperation("SourceMap",[IsPosetHomomorphism]);

#! @Arguments f
#! @Description The target $Y$ of a map $f\colon X\to Y$.
DeclareOperation("TargetMap",[IsPosetHomomorphism]);

#! @Arguments f
#! @Description A &GAP; function computing <C>f</C>.
DeclareOperation("UnderlyingFunction",[IsPosetHomomorphism]);

#! @BeginGroup
#! @Arguments f
#! @Description The inverse of the isomorphism f.
DeclareAttribute("Inverse",IsPosetHomomorphism);
#! @Arguments f
DeclareAttribute("InverseImmutable",IsPosetHomomorphism);
#! @EndGroup

#! @Arguments f
#! @Description the image $f(X)$ of a map $f\colon X\to Y$, given as a subposet of $Y$.
DeclareOperation("ImageMap",[IsPosetHomomorphism]);

#! @BeginGroup
#! @Description The image $f(x)$ of an element $x\in X$ by the map $f\colon X \to Y$.
#! @Arguments f,x
DeclareOperation("ImageMap",[IsPosetHomomorphism,IsObject]);
#! @Arguments x,f
DeclareOperation("\^",[IsObject,IsPosetHomomorphism]);
#! @EndGroup


# Not documented!
DeclareOperation("\*",[IsList,IsPosetHomomorphism]);
DeclareOperation("\*",[IsPosetHomomorphism,IsList]);

#! @Label f^n
#! @Arguments f,n
#! @Description Returns $f^n$. If $n=0$ returns the identity. It works for $n&lt;0$ if $f$ is an isomorphism.
DeclareOperation("\^",[IsPosetHomomorphism,IsInt]);

