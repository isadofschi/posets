gap> RP2:=FiniteModelProjectivePlane();
<finite poset of size 13>
gap> pi:=FundamentalGroup(RP2);
#I  there are 1 generator and 1 relator of total length 2
<fp group on the generators [ f1 ]>
gap> Size(pi)=2;
true
gap> PosetHomology(RP2);
[ [ 0 ], [ 2 ], [  ] ]
gap> Core(RP2);
<finite poset of size 13>
