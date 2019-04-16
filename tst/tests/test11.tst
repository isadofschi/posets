gap> S2:=MinimalFiniteModelSphere(2);
<finite poset of size 6>
gap> HasFixedPointProperty(S2);
false
gap> HasFixedPointProperty(EmptyPoset());  
false
X1:=PosetByOrderMatrix([[true]]);
<finite poset of size 1>
gap> HasFixedPointProperty(X1);
true

