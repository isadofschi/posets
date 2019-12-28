gap> S1:=PosetByCoveringRelations([1,2,3,4], [[3,1],[3,2],[4,1],[4,2]]);
<finite poset of size 4>
gap> UpperCovers(S1,1);
[ 3, 4 ]
gap> fun:=UpperCovers(S1);
function( x ) ... end
gap> fun(1);
[ 3, 4 ]
gap> fun(3);
[  ]
gap> CoveringRelations(S1);
[ [ 3, 1 ], [ 3, 2 ], [ 4, 1 ], [ 4, 2 ] ]
gap> g:=LowerCovers(S1);
function( x ) ... end
gap> g(2);
[  ]
gap> g(4);
[ 1, 2 ]
gap> LowerCovers(S1,4);
[ 1, 2 ]

