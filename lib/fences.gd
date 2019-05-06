#! Shortest path in poset
DeclareOperation("PathInPoset",[IsPoset,IsObject,IsObject]);
#! A shortest fence
DeclareOperation("Fence",[IsPosetHomomorphism,IsPosetHomomorphism]);
#!
DeclareOperation("AreHomotopic",[IsPosetHomomorphism,IsPosetHomomorphism]);
#!
DeclareOperation("ConnectedComponents",[IsPoset]);
