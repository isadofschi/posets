gap> S1:=MinimalFiniteModelSphere(1);
<finite poset of size 4>
gap> S2:=MinimalFiniteModelSphere(2);
<finite poset of size 6>
gap> IsomorphismPosets(S1,S2);
fail
gap> IsomorphismPosets(SuspensionPoset(S1),S2);
<order preserving map>
gap> IsomorphismPosets(SuspensionPoset(ConePoset(S1)),ConePoset(S2));
fail
gap> HomotopyEquivalence( MinimalFiniteModelSphere(3), ConePoset(MinimalFiniteModelSphere(2)) );
fail
gap> HomotopyEquivalence(SuspensionPoset(ConePoset(MinimalFiniteModelSphere(3))), ConePoset(MinimalFiniteModelSphere(2)) );
<order preserving map>

