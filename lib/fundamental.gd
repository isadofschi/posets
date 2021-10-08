# Returns a spanning tree of the graph (V,E)
# E must be a list of edges [v,w] where v,w are vertices in V
# returns fail if the graph is not connected
DeclareGlobalFunction("SpanningTreeOfGraph");

# Edge path group of a simplicial complex. The arguments are v,e,f.
DeclareGlobalFunction("EdgePathGroup");

# Size 3 cliques of a simple graph
DeclareGlobalFunction("SizeThreeCliques");

# (vertices,edges) must be a simple graph
DeclareGlobalFunction("FundamentalGroupOfCliqueComplex");
