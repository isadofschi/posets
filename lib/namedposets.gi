InstallMethod(EmptyPoset,
"for ",
[],
function()
	return PosetByFunctionNC([],ReturnTrue);
end);

InstallMethod(MinimalFiniteModelSphere,
"for Integer>=-1",
[IsInt],
function(n)
	if n<-1 then
		Error("n < -1");
	fi;
	if n=-1 then
		return EmptyPoset();
	fi;
	return SuspensionPoset(MinimalFiniteModelSphere(n-1));
end);


