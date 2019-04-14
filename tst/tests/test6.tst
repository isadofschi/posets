gap> S2A5:=PosetOfpSubgroups(AlternatingGroup(5),2);
<finite poset of size 20>
gap> PosetHomology(S2A5);
[ [ 4, [  ] ], [ 0, [  ] ] ]
gap> Set(S2A5);
[ Group([ (2,3)(4,5) ]), Group([ (2,3)(4,5), (2,4)(3,5) ]), Group([ (2,4)
  (3,5) ]), Group([ (2,5)(3,4) ]), Group([ (1,2)(4,5) ]), Group([ (1,4)
  (2,5), (1,5)(2,4) ]), Group([ (1,2)(3,4) ]), Group([ (1,4)(2,3), (1,2)
  (3,4) ]), Group([ (1,2)(3,5) ]), Group([ (1,5)(2,3), (1,3)(2,5) ]), 
  Group([ (1,3)(4,5) ]), Group([ (1,4)(3,5), (1,3)(4,5) ]), Group([ (1,3)
  (2,4) ]), Group([ (1,3)(2,5) ]), Group([ (1,4)(3,5) ]), Group([ (1,4)
  (2,3) ]), Group([ (1,4)(2,5) ]), Group([ (1,5)(3,4) ]), Group([ (1,5)
  (2,3) ]), Group([ (1,5)(2,4) ]) ]
gap> PosetHomology(S2A5);
[ [ 4, [  ] ], [ 0, [  ] ] ]
gap> PosetOfpSubgroups(AlternatingGroup(5),5);
<finite poset of size 6>
gap> PosetOfpSubgroups(AlternatingGroup(5),3);
<finite poset of size 10>
gap> S2A6:=PosetOfpSubgroups(AlternatingGroup(6),2);
<finite poset of size 165>
gap> PosetHomology(S2A6);                           
[ [ 0, [  ] ], [ 16, [  ] ], [ 0, [  ] ] ]
gap> S2A7:=PosetOfpSubgroups(AlternatingGroup(7),2);
<finite poset of size 875>
gap> PosetHomology(S2A7);
[ [ 0, [  ] ], [ 176, [  ] ], [ 0, [  ] ] ]
gap> S3A7:=PosetOfpSubgroups(AlternatingGroup(7),3);
<finite poset of size 245>
gap> PosetHomology(S3A7);                           
[ [ 0, [  ] ], [ 36, [  ] ] ]

