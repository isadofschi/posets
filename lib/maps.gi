#############################################################################
##
#W  maps.gi             posets Package
##
##
##  
##  
##


PosetHomomorphismFamily:=NewFamily("PosetHomomorphismFamily",IsPosetHomomorphism and IsMutable and IsCopyable );;
PosetHomomorphismType:=NewType(PosetHomomorphismFamily,  IsPosetHomomorphism and IsAttributeStoringRep );;

InstallMethod(ViewObj,
"for PosetHomomorphism",
[IsPosetHomomorphism],
function(X)
	Print("<order preserving map>");
end);

InstallMethod(PrintObj,"for PosetHomomorphism",
[IsPosetHomomorphism],
function(X)
	Print("<order preserving map>");
end);

InstallMethod(\=,"for PosetHomomorphism and PosetHomomorphism",
[IsPosetHomomorphism,IsPosetHomomorphism],
function(f,g)
	return [SourceMap(f), TargetMap(f), List(Set(SourceMap(f)),UnderlyingFunction(f)) ] =  [SourceMap(g), TargetMap(g), List(Set(SourceMap(g)),UnderlyingFunction(g)) ];
end);

# the purpose of defining this is total order to consider Sets of poset homomorphisms
# this order is not meaningful (it is not the same as the partial order f<g := (forall x) fx<gx )
InstallMethod(\<,"for PosetHomomorphism and PosetHomomorphism",
[IsPosetHomomorphism,IsPosetHomomorphism],
function(f,g)
	return [SourceMap(f), TargetMap(f), List(Set(SourceMap(f)),UnderlyingFunction(f)) ] <  [SourceMap(g), TargetMap(g), List(Set(SourceMap(g)),UnderlyingFunction(g)) ];
end);


InstallMethod(SourceMap,
"for Poset homomorphism",
[IsPosetHomomorphism],
function(f)
	return f!.source;
end);

InstallMethod(TargetMap,
"for Poset homomorphism",
[IsPosetHomomorphism],
function(f)
	return f!.target;
end);

InstallMethod(UnderlyingFunction,
"for Poset homomorphism",
[IsPosetHomomorphism],
function(f)
	return f!.f;
end);

InstallMethod(InverseImmutable,
"for Poset homomorphism",
[IsPosetHomomorphism],
function(f)
	local l,ims;
	if Size(SourceMap(f))<>Size(SourceMap(f)) then
		return fail;
	fi;
	l:=List(Set(SourceMap(f)),UnderlyingFunction(f));
	if Size(Set(l))<>Size(SourceMap(f)) then
		return fail;
	fi;
	ims:=ShallowCopy(Set(SourceMap(f)));
	SortParallel(l,ims);
	return PosetHomomorphismByImages(TargetMap(f),SourceMap(f),ims);
end);



InstallMethod(ImageMap,
"for Poset homomorphism",
[IsPosetHomomorphism],
function(f)
	return SubPoset(TargetMap(f), Set(List(Set(f!.source),f!.f)) );
end);

InstallMethod(ImageMap,
"for Poset homomorphism, element",
[IsPosetHomomorphism,IsObject],
function(f,x)
	local X;
	X:=Set(SourceMap(f));
	if not x in X then
		Error("x is not an element of the domain of f");
	fi;
	return f!.f(x);
end);


InstallMethod(\^,
"for element, Poset homomorphism",
[IsObject,IsPosetHomomorphism],
function(x,f)
	return ImageMap(f,x);
end);

InstallOtherMethod(IdentityMap,
"for Poset",
[IsPoset],
function(X)
	return PosetHomomorphismByFunction(X,X, x->x);
end);


InstallMethod(CompositionPosetHomomorphisms,
"for PosetHomomorphism and PosetHomomorphism",
[IsPosetHomomorphism,IsPosetHomomorphism],
function(g,f)
	if SourceMap(g)<>TargetMap(f) then
		return fail;
	fi;
	return PosetHomomorphismByFunctionNC(SourceMap(f),TargetMap(g), x-> (g!.f)(f!.f(x)) );
end);

InstallMethod(\*,
"for PosetHomomorphism and PosetHomomorphism",
[IsPosetHomomorphism,IsPosetHomomorphism],
function(g,f)
	return CompositionPosetHomomorphisms(f,g);
end);


InstallMethod(\*,
"for IsList and PosetHomomorphism",
[IsList,IsPosetHomomorphism],
function(l,g)
	if ForAll(l, IsPosetHomomorphism) then
		return List(l, f->f*g);
	else
		TryNextMethod();
	fi;
end);

InstallMethod(\*,
"for PosetHomomorphism and IsList",
[IsPosetHomomorphism,IsList],
function(f,l)
	if ForAll(l, IsPosetHomomorphism) then
		return List(l, g->f*g);
	else
		TryNextMethod();
	fi;
end);


InstallMethod(\^,
"for PosetHomomorphism and Integer",
[IsPosetHomomorphism,IsInt],
function(f,n)
	local m,g,fn;
	if n=1 then
		return f;
	fi;
	if n=-1 then
		return Inverse(f);
	fi;
	if SourceMap(f)=TargetMap(f) then
		if n=0 then
			return IdentityMap(SourceMap(f));
		fi;
		if n>0 then
			m:=n;
			g:=f;
			fn:=f^0;
			while m>0 do
				if RemInt(m,2)=1 then
					fn:=fn*g;
				fi;
				g:=g*g;
				m:=QuoInt(m,2);
			od;
			return fn;
		fi;
		if n<0 and f^-1<> fail then
			return (f^-1)^(-n);
		fi;
	fi;
	return fail;
end);

