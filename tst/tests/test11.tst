gap> S2:=MinimalFiniteModelSphere(2);
<finite poset of size 6>
gap> HasFixedPointProperty(S2);
false
gap> HasFixedPointProperty(EmptyPoset());  
false
gap> X1:=ConePoset(EmptyPoset());
<finite poset of size 1>
gap> HasFixedPointProperty(X1);
true
gap> HasFixedPointProperty(ConePoset(ConePoset(ConePoset(ConePoset(ConePoset(ConePoset(EmptyPoset())))))));
true

