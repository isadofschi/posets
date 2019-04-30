#! @Chapter More properties
#! @Section Fixed Point Property


#!
# SubPoset of fixed points of f. We only check names of points, Source(f) is not neccesarily equal to Target(f)
DeclareAttribute("FixedPointsPosetHomomorphism",IsPosetHomomorphism);

#!
DeclareProperty("HasFixedPointProperty",IsPoset);

#!
DeclareAttribute("Grading",IsPoset);

#!
DeclareOperation("Height",[IsPoset,IsObject]);
#!
DeclareAttribute("Height",IsPoset);

