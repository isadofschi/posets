gap> W:=TheWallet();
<finite poset of size 11>
gap> R:=RelationByPoset(W);;
gap> IsPartialOrderBinaryRelation(R);
true
gap> OrderMatrix(W);
[ [ true, false, false, false, true, true, false, false, true, true, false ],
  [ false, true, false, false, true, false, true, false, true, true, true ],
  [ false, false, true, false, false, true, false, true, true, true, true ],
  [ false, false, false, true, false, false, true, true, false, true, true ],
  [ false, false, false, false, true, false, false, false, true, true, false ],
  [ false, false, false, false, false, true, false, false, true, true, false ],
  [ false, false, false, false, false, false, true, false, false, true, true ],
  [ false, false, false, false, false, false, false, true, false, true, true ],
  [ false, false, false, false, false, false, false, false, true, false, false ],
  [ false, false, false, false, false, false, false, false, false, true, false ],
  [ false, false, false, false, false, false, false, false, false, false, true ] ]
