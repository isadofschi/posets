#############################################################################
##
#W  constructions.gd             Posets Package
##
##
##  
##  
##

#! @Chapter Constructing new posets

#! @Section Categorical constructions
# DirectProduct. DirectProduct and Coproduct for maps

#! @Arguments X, A
DeclareOperation("SubPoset",[IsPoset,IsList]);

DeclareOperation("CoproductOp",[IsList,IsPoset]);

#! @Arguments X_1,X_2,...
#! @Description The coproduct of posets
DeclareGlobalFunction("Coproduct");


DeclareOperation("JoinOp",[IsList,IsPoset]);

#! @Arguments X_1,X_2,...
#! @Description The join of posets
DeclareGlobalFunction("Join");


#! @Arguments X
DeclareOperation("ConePoset",[IsPoset]);

#! @Arguments X
DeclareOperation("SuspensionPoset",[IsPoset]);

#! @Arguments X
DeclareOperation("OppositePoset",[IsPoset]);

#! @Arguments f
DeclareOperation("MappingCylinderPosetHomomorphism",[IsPosetHomomorphism]);

#! @Arguments X,A
#! @Description See <Cite Key="BarmakBook" Where="Section 2.7"/>
DeclareOperation("QuotientPoset",[IsPoset,IsList]);

#!
DeclareOperation("WedgePosets",[IsList]);

#! @Arguments X,Y
#! @Description The poset $Y^X$.
DeclareOperation("HomPosets",[IsPoset,IsPoset]);

#! @Arguments X
DeclareAttribute("Endomorphisms",IsPoset);

#! @Arguments X
#! @Description The automorphism group $\mathrm{Aut}(X)$.
DeclareAttribute("AutomorphismGroup",IsPoset);

#! @Arguments X
DeclareAttribute("Automorphisms",IsPoset);

#! @Section Natural maps
#! @Arguments X
#! @Returns the natural maps of the poset X.
#! @Description for example NaturalMaps of a product gives the projections.
DeclareOperation("NaturalMaps",[IsPoset]);

