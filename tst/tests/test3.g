gap> Sigma1:=PosetByOrderMatrix([[true,false,true,true],[false,true,true,true],[false,false,true,false],[false,false,false,true]], ["a","b","c","d"]);
<finite poset of size 4>
gap> PosetHomology(Sigma1);
[ [ 0, [  ] ], [ 1, [  ] ] ]
gap> EulerCharacteristic(Sigma1);
0
gap> FundamentalGroup(Sigma1)
<fp group of size infinity on the generators [ [2,4] ]>

