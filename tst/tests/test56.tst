gap> FundamentalGroupOfCliqueComplex([1,2,3],[[1,2],[2,3]]);
<fp group on the generators [ f1, f2 ]>
gap> Order(last);
1
gap> FundamentalGroupOfCliqueComplex([1,2,3],[[1,2],[2,3],[3,1]]);
<fp group on the generators [ f1, f2, f3 ]>
gap> Order(last);
1
gap> FundamentalGroupOfCliqueComplex([1,2,3,4],[[1,2],[2,3],[3,4],[1,4]]);
<fp group of size infinity on the generators [ f1, f2, f3, f4 ]>
gap> Order(last);
infinity

