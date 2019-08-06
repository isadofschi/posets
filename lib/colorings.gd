#! @Chapter Homotopy theory

#! @Section Colorings

#! Colorings were introduced by Barmak and Minian in <Cite Key="BarmakMinianColorings"/>.

#! @BeginGroup
#! @Description Computes the fundamental group of $X$ using colorings. If a collapsible spanning subposet $A$ is given it may produce a smaller presentation (the spanning collapsible version is not implemented).
#! @Arguments X
DeclareOperation("FundamentalGroupByColoring",[IsPoset]);
#! @Arguments X,A
DeclareOperation("FundamentalGroupByColoring",[IsPoset,IsList]);
#! @EndGroup

# to do : spanning collapsible
