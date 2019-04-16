gap> Sigma1:=PosetByOrderMatrix(["a","b","c","d"],[[true,false,true,true],[false,true,true,true],[false,false,true,false],[false,false,false,true]]);
<finite poset of size 4>
gap> PosetHomology(Sigma1);
[ [ 0 ], [ 0 ] ]
gap> EulerCharacteristic(Sigma1);
0
gap> FundamentalGroup(Sigma1);
<fp group of size infinity on the generators [ f1 ]>
gap> A:=SubPoset(Sigma1,["a","b","d"]);
<finite poset of size 3>
gap> FundamentalGroup(A);
<free group on the generators [  ]>
gap> AnotherSigma1:=PosetByCoveringRelations(["a","b","c","d"],[["a","c"],["a","d"],["b","c"],["b","d"]]);
<finite poset of size 4>
gap> Sigma1=AnotherSigma1;
true

