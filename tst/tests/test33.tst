gap> P:=CyclicGroup(4);
<pc group of size 4 with 2 generators>
gap> SpG:=BrownPoset(P,2);
<finite poset of size 2>
gap> MaximumPoset(SpG);
Group([ f2, f1 ])
gap> MinimumPoset(SpG);
Group([ f2 ])
gap> W:=TheWallet();
<finite poset of size 11>
gap> MaximumPoset(W);
fail
gap> MinimumPoset(W);
fail
