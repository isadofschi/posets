#! @Chapter Posets

#! @Section Plotting posets

#! @Arguments X,use_names
#! @Description Returns a string in the DOT language representing the Hasse diagram of the poset.
DeclareGlobalFunction("DotCode");

#! @Arguments X, filename
#! @Description This function computes the Hasse diagram of X using the command dot, which is displayed and stored at filename. The software graphviz is needed.
DeclareGlobalFunction("HasseDiagram");
