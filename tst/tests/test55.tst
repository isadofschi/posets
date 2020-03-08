gap> G:=SmallGroup(27,5);
<pc group of size 27 with 3 generators>
gap> P:=PosetOfSubgroups(G);
<finite poset of size 28>
gap> Size(P);
28
gap> P_red:=SubPoset(P,Difference(Set(P),[Group([Identity(G)]),G]));
<finite poset of size 26>
gap> Size(P_red);
26
gap> EulerCharacteristic(OrderComplex(P_red))-1;
-27
gap> mu:=MobiusFunction(P);
function( x, y ) ... end
gap> mu(Group([Identity(G)]),G);
-27
gap> MobiusMatrix(P)=TransposedMat(Inverse(List(OrderMatrix(P),x->List(x, function(n) if n then return 1; fi; return 0;end))));
true
gap> MobiusMatrix(P);
[ [ 1, -1, -1, 3, 3, 3, -1, 3, 3, -27, 3, 3, -1, -1, -1, 3, 3, 3, -1, -1, -1, 
      -1, 3, 3, 3, -1, -1, -1 ], 
  [ 0, 1, 0, -1, 0, 0, 0, -1, 0, 3, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, -1, 
      0, 0, 0, 0, 0 ], 
  [ 0, 0, 1, -1, -1, -1, 0, 0, -1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 1, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 1, -1, -1, 3, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0 ], 
  [ 0, 0, 0, -1, 0, 0, 0, 0, 0, 3, -1, 0, 1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 
      -1, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, -1, 0, 0, -1, 0, 3, 0, 0, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 
      -1, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, -1, 3, 0, 0, 0, 0, 1, -1, -1, -1, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0 ], 
  [ 0, 0, 0, -1, 0, 0, 0, 0, 0, 3, 0, -1, 0, 0, 0, 0, -1, 0, 1, 0, 0, 0, 0, 
      0, -1, 0, 0, 0 ], 
  [ 0, 0, 0, 0, -1, 0, 0, 0, 0, 3, -1, 0, 0, 0, 0, -1, 0, 0, 0, 1, 0, 0, 0, 
      0, -1, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, -1, 0, -1, 0, 3, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 1, 0, 0, 
      0, -1, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, -1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, -1, 
      -1, -1, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 
      0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
      0, 0, 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
      1, 0, 0, 0 ], 
  [ 0, 0, 0, 0, -1, 0, 0, 0, 0, 3, 0, -1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1, 
      0, 0, 1, 0, 0 ], 
  [ 0, 0, 0, 0, 0, -1, 0, 0, 0, 3, -1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, -1, 
      0, 0, 0, 1, 0 ], 
  [ 0, 0, 0, 0, 0, -1, 0, 0, 0, 3, 0, -1, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 
      -1, 0, 0, 0, 1 ] ]
gap> check_G:=function(G)
>       local P,P_red,mu;
>       P:=PosetOfSubgroups(G);
>       P_red:=SubPoset(P,Difference(Set(P),[Group([Identity(G)]),G]));
>       mu:=MobiusFunction(P);
>       return 1+mu(Group([Identity(G)]),G) = EulerCharacteristic(OrderComplex(P_red));
> end;
function( G ) ... end
gap> ForAll([1..NrSmallGroups(16)], i-> check_G(SmallGroup(16,i)));
true
gap> ForAll([1..NrSmallGroups(27)], i-> check_G(SmallGroup(27,i)));
true
gap> ForAll([1..NrSmallGroups(25)], i-> check_G(SmallGroup(25,i)));
true
gap> ForAll([1..NrSmallGroups(9)], i-> check_G(SmallGroup(9,i)));
true
gap> ForAll([1..NrSmallGroups(1)], i-> check_G(SmallGroup(1,i)));
false
gap> ForAll([1..NrSmallGroups(3)], i-> check_G(SmallGroup(3,i)));
true
gap> EulerCharacteristic(MinimalFiniteModelSphere(4));
2
gap> EulerCharacteristic(MinimalFiniteModelSphere(3));
0
gap> EulerCharacteristic(MinimalFiniteModelSphere(11));
0
gap> EulerCharacteristic(MinimalFiniteModelSphere(12));
2
gap> EulerCharacteristic(QuillenPoset(SymmetricGroup(6),2))= EulerCharacteristicQuillenPoset(SymmetricGroup(6),2);
true
gap> EulerCharacteristic(QuillenPoset(SymmetricGroup(4),2))= EulerCharacteristicQuillenPoset(SymmetricGroup(4),2);
true
gap> EulerCharacteristic(QuillenPoset(SymmetricGroup(5),2))= EulerCharacteristicQuillenPoset(SymmetricGroup(5),2);
true
gap> EulerCharacteristic(QuillenPoset(SymmetricGroup(7),2))= EulerCharacteristicQuillenPoset(SymmetricGroup(7),2);
true
gap> EulerCharacteristicQuillenPoset(SymmetricGroup(6),12);
# Error, p must be a prime number dividing the order of G
fail

