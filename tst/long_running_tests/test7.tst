# Example taken from "The fundamental group of the p-subgroup complex" by K. Piterman and E.G. Minian
# 7408440 ms (89096 ms GC) and 149GB allocated for test7.tst
gap> X1:=PosetOfRadicalpSubgroups(AlternatingGroup(10),3);
<finite poset of size 24620>
gap> K:=OrderComplex(X1);;
gap> pi:=FundamentalGroup(K);
#I  there are 25253 generators and 872 relators of total length 235485
#I  there are 25248 generators and 867 relators of total length 365164
#I  there are 25244 generators and 863 relators of total length 583288
#I  there are 25242 generators and 861 relators of total length 1191496
#I  there are 25242 generators and 861 relators of total length 1166472
<fp group of size infinity with 25242 generators>
gap> AbelianInvariants(pi)=List([1..25242],x->0); 
true

