gap> W:=TheWallet();
<finite poset of size 11>
gap> Set(W);
[ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 ]
gap> UpperCovers(W,10);
[ 5, 6, 7, 8 ]
gap> fun:=UpperCovers(W);
function( x ) ... end
gap> fun(1);
[  ]
gap> fun(10);
[ 5, 6, 7, 8 ]
gap> fun(5);
[ 1, 2 ]
gap> CoveringRelations(W);
[ [ 1, 5 ], [ 1, 6 ], [ 2, 5 ], [ 2, 7 ], [ 3, 6 ], [ 3, 8 ], [ 4, 7 ], [ 4, 8 ], [ 5, 9 ], [ 5, 10 ], [ 6, 9 ],
  [ 6, 10 ], [ 7, 10 ], [ 7, 11 ], [ 8, 10 ], [ 8, 11 ] ]
gap> S1:=MinimalFiniteModelSphere(2);
<finite poset of size 6>
gap> Set(S1);
[ [ 1, "x" ], [ 1, "y" ], [ 2, "x" ], [ 2, "y" ], [ 3, "x" ], [ 3, "y" ] ]
gap> fun:=LowerCovers(S1);
function( x ) ... end
gap> fun([2,"x"]);
[ [ 1, "x" ], [ 1, "y" ] ]
gap> fun([3,"y"]);
[ [ 2, "x" ], [ 2, "y" ] ]
gap> CoveringRelations(S1);
[ [ [ 2, "x" ], [ 1, "x" ] ], [ [ 2, "x" ], [ 1, "y" ] ], [ [ 2, "y" ], [ 1, "x" ] ], [ [ 2, "y" ], [ 1, "y" ] ],
  [ [ 3, "x" ], [ 2, "x" ] ], [ [ 3, "x" ], [ 2, "y" ] ], [ [ 3, "y" ], [ 2, "x" ] ], [ [ 3, "y" ], [ 2, "y" ] ] ]
gap> LowerCovers(S1,[2,"y"]);
[ [ 1, "x" ], [ 1, "y" ] ]
