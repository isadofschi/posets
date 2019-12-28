gap> P:=PosetByCoveringRelations([1,2,3,4], [[2,1], [3,1], [4,2], [4,3]]);
<finite poset of size 4>
gap> IsWeakPoint(P,1);
true
gap> IsUpWeakPoint(P,1);
true
gap> IsUpBeatPoint(P,1);
false
gap> IsBeatPoint(P,1);
false
gap> IsDownBeatPoint(P,4);
false
gap> IsBeatPoint(P,4);
false
gap> IsDownWeakPoint(P,4);
true
gap> WeakPoints(P);
[ 1, 2, 3, 4 ]
gap> UpWeakPoints(P);
[ 1, 2, 3 ]
gap> DownWeakPoints(P);
[ 2, 3, 4 ]
gap> WeakCore(P);
<finite poset of size 1>
gap> W:=TheWallet();
<finite poset of size 11>
gap> WeakCore(W);
<finite poset of size 1>
gap> MinWeakCore(W);
<finite poset of size 1>
gap> IsCollapsible(W);
true
gap> IsCollapsible(MinimalFiniteModelSphere(2));
false
