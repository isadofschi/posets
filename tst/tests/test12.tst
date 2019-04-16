gap> S1:=MinimalFiniteModelSphere(1);
<finite poset of size 6>
gap> S2:=MinimalFiniteModelSphere(2);
<finite poset of size 4>
gap> IsomorphismPosets(S1,S2);
fail
gap> IsomorphismPosets(SuspensionPoset(S1),S2);
<order preserving map>
gap> IsomorphismPosets(SuspensionPoset(ConePoset(S1)),ConePoset(S2));
fail

