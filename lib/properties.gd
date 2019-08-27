#! @Chapter Topology
#! @Section Fixed Point Property


#! @Arguments f
#! @Description Returns the subposet of fixed points of $f$. We only check names of points, Source(f) is not neccesarily equal to Target(f).
DeclareAttribute("FixedPointsPosetHomomorphism",IsPosetHomomorphism);

#! @Arguments X
#! @Description Returns true if every order preserving map $f\colon X \to X$ has a fixed point, false otherwise.
DeclareProperty("HasFixedPointProperty",IsPoset);

#! @Chapter Classical stuff
#! @Section Grading and height

#! @Arguments X
#! @Description Returns a grading if the poset is graded and fail otherwise. The grading is chosen so that the minimum grade is 0.
DeclareAttribute("Grading",IsPoset);

#! @Arguments X,x
#! @Description The Height of a point in a poset.
DeclareOperation("Height",[IsPoset,IsObject]);

#! @Arguments X
#! @Description The height of a poset.
DeclareAttribute("Height",IsPoset);

#! @Arguments X
#! @Description The list of chains of <A>X</A>. Each chain is represented as a list of points, ordered according to the order on <A>X</A>, the first element being the maximum of the chain.
DeclareOperation("ChainsPoset",[IsPoset]);

