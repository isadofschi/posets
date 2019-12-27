gap> S1:=MinimalFiniteModelSphere(1);
<finite poset of size 4>
gap> OrderMatrix(S1);;
gap> fun:=OrderingByIndex(S1);
function( i, j ) ... end
gap> fun(1,3);
false
gap> fun(3,1);
true
gap> fun(2,2);
true
gap> W:=TheWallet();
<finite poset of size 11>
gap> HasOrderMatrix(W);
false
gap> fun2:=OrderingByIndex(W);
function( i, j ) ... end
gap> fun2(1,2);
false
gap> fun2(2,1);
false
gap> fun2(1,10);
true
