gap> Sigma1:=PosetByOrderMatrix([[true,false,true,true],[false,true,true,true],[false,false,true,false],[false,false,false,true]], ["a","b","c","d"]);
<finite poset of size 4>
gap> coprod:=CoproductPosets([Sigma1,Sigma1]);
<finite poset of size 8>
gap> OrderMatrix(coprod);
[ [ true, false, true, true, false, false, false, false ], 
  [ false, true, true, true, false, false, false, false ], 
  [ false, false, true, false, false, false, false, false ], 
  [ false, false, false, true, false, false, false, false ], 
  [ false, false, false, false, true, false, true, true ], 
  [ false, false, false, false, false, true, true, true ], 
  [ false, false, false, false, false, false, true, false ], 
  [ false, false, false, false, false, false, false, true ] ]
gap> Set(CoproductPosets([Sigma1,Sigma1]));
[ [ 1, "a" ], [ 1, "b" ], [ 1, "c" ], [ 1, "d" ], [ 2, "a" ], [ 2, "b" ], 
  [ 2, "c" ], [ 2, "d" ] ]
gap> NaturalMaps(coprod);
[ <order preserving map>, <order preserving map> ]
gap> Set(CoproductPosets([Sigma1,Sigma1,Sigma1]));
[ [ 1, "a" ], [ 1, "b" ], [ 1, "c" ], [ 1, "d" ], [ 2, "a" ], [ 2, "b" ], 
  [ 2, "c" ], [ 2, "d" ], [ 3, "a" ], [ 3, "b" ], [ 3, "c" ], [ 3, "d" ] ]
gap> PosetHomology(coprod);
[ [ 0, 0 ], [ 0, 0 ] ]
gap> Sigma3:=JoinPosets([Sigma1,Sigma1]);
<finite poset of size 8>
gap> PosetHomology(Sigma3);        
[ [ 0 ], [  ], [  ], [ 0 ] ]
gap> T3:=ProductPosets([Sigma1,Sigma1,Sigma1]);
<finite poset of size 64>
gap> PosetHomology(T3);
[ [ 0 ], [ 0, 0, 0 ], [ 0, 0, 0 ], [ 0 ] ]



