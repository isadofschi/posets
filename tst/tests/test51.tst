gap> RandomWeakPointReduction(TheWallet());
# Weak point reduction: 3
<finite poset of size 10>
gap> RandomWeakPointReduction(MinimalFiniteModelSphere(1));
# No weak points.
<finite poset of size 4>
#! gap> RandomQCReduction(TheWallet());
#! # QC reduction: 3 4
#! <finite poset of size 10>
gap> RandomQCReduction(MinimalFiniteModelSphere(1));
# No QC reductions.
<finite poset of size 4>
gap> RandomMiddleReduction(TheWallet());
# Middle reduction: 5 6
<finite poset of size 10>
gap> RandomMiddleReduction(MinimalFiniteModelSphere(2));
# No middle reduction.
<finite poset of size 6>
gap> RandomEdgeReduction(TheWallet());
# Edge reduction: [ 7, 11 ]
<finite poset of size 11>
gap> RandomEdgeReduction(MinimalFiniteModelSphere(3));
# No edge reduction.
<finite poset of size 8>
gap> RandomOsakiReduction(TheWallet());
# Up Osaki reduction: 5
<finite poset of size 9>
gap> RP2:=FiniteModelProjectivePlane();
<finite poset of size 13>
gap> RandomReductionCore(RP2);
# No QC reductions.
# No Osaki reduction.
# No edge reduction.
# No weak points.
# No middle reduction.
# No more reductions.
<finite poset of size 13>
gap> RandomReduction(RP2);
# No weak points.
# No edge reduction.
# No middle reduction.
# No QC reductions.
# No Osaki reduction.
# No more reductions.
<finite poset of size 13>

