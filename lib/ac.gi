
InstallMethod(AkbulutKirbyGroup,
"for Integer",
[IsInt],
function(n)
	local F,x,y,R;
	F:=FreeGroup("x","y");;
	x:=F.1;; y:=F.2;;
	R:=[x^n*y^-(n+1),x*y*x*y^-1*x^-1*y^-1];;
	return F/R;
end);


InstallMethod(RapaportGroup,
"for ",
[],
function()
	local F,x,y,z,R;
	F := FreeGroup("x","y","z");;
	x := F.1;; y:=F.2;; z:=F.3;;
	R := [ z^-1*y*z*y^-2, x^-1*z*x*z^-2, y^-1*x*y*x^-2 ];;
	return F/R;
end);

InstallMethod(GordonGroup,
"for Integer, Integer, Integer, Integer",
[IsInt,IsInt,IsInt,IsInt],
function(n,m,p,q)
	local F,x,y,R;
	F:=FreeGroup("x","y");;
	x:=F.1;; y:=F.2;;
	R:=[x*(x^m*y^n*x^-m*y^-n)^-1, y*(x^p*y^q*x^-p*y^-q)^-1];;
	return F/R;
end);

