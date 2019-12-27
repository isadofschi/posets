gap> G:=AlternatingGroup(5);
Alt( [ 1 .. 5 ] )
gap> SpG:=BrownPoset(G,2);
<finite poset of size 20>
gap> Max:=MaximalElements(SpG);;
gap> Size(Max);
5
gap> List(Max,Order);
[ 4, 4, 4, 4, 4 ]
gap> S:=SylowSubgroup(G,2);;
gap> N:=Normalizer(G,S);;
gap> Index(G,N);
5
gap> Min:=MinimalElements(SpG);;
gap> Size(Min);
15
gap> List(Min,Order);
[ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ]


