gap> S2:=MinimalFiniteModelSphere(2);
<finite poset of size 6>
gap> AutomorphismGroup(S2);
C2 x C2 x C2
gap> HomS2S2:=HomPosets(S2,S2);
<finite poset of size 446>
gap> CoreHomS2S2:=CorePoset(HomS2S2);
<finite poset of size 14>
gap> OrderMatrix(CoreHomS2S2);
[ [ true, false, false, false, false, false, false, false, false, false, false, false, false, false ], 
  [ false, true, false, false, false, false, false, false, false, false, false, false, false, false ], 
  [ false, false, true, false, false, false, false, false, false, false, false, false, false, false ], 
  [ false, false, false, true, false, false, false, false, false, false, false, false, false, false ], 
  [ false, false, false, false, true, false, false, false, false, false, false, false, false, false ], 
  [ false, false, false, false, false, true, false, false, false, false, false, false, false, false ], 
  [ false, false, false, false, false, false, true, false, false, false, false, false, false, false ], 
  [ false, false, false, false, false, false, false, true, false, false, false, false, false, false ], 
  [ false, false, false, false, false, false, false, false, true, false, false, false, false, false ], 
  [ false, false, false, false, false, false, false, false, false, true, false, false, false, false ], 
  [ true, false, false, false, false, false, false, false, false, true, true, false, false, false ], 
  [ true, false, false, false, false, false, false, false, false, true, false, true, false, false ], 
  [ true, false, false, false, false, false, false, false, false, true, true, true, true, false ], 
  [ true, false, false, false, false, false, false, false, false, true, true, true, false, true ] ]
gap> c:=ConnectedComponents(CoreHomS2S2);
[ <finite poset of size 6>, <finite poset of size 1>, <finite poset of size 1>, <finite poset of size 1>, 
  <finite poset of size 1>, <finite poset of size 1>, <finite poset of size 1>, <finite poset of size 1>, 
  <finite poset of size 1> ]
gap> IsomorphismPosets(c[1],S2);
<order preserving map>

