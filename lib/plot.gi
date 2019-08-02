InstallGlobalFunction(DotCode,
function(X,use_names)
	local n,M,s,e,e1,rels;
	n:=Size(X);
	M:=OrderMatrix(X);
	s := "digraph D{\n";
	rels := CoveringRelations(X);
	for e in rels do
		if use_names then
			e1:=e;
		else
			e1:=List(e, x->PositionSorted(Set(X),x));
		fi;
		s:=Concatenation(s,"  \"",String(e1[1]),"\" -> \"",String(e1[2]),"\"\n");
	od;
	s:=Concatenation(s,"}");
	return s;
end);

InstallGlobalFunction(HasseDiagram,
function(X,filename)
	local out,s,tmp_name,ext,ps;
	ps:=SplitString(filename,".");
	ext:=ps[Size(ps)];
	tmp_name := Concatenation(filename,".tmp");
	out:=OutputTextFile(tmp_name, false);
	s:=DotCode(X,false);
	AppendTo(out,s);
	Exec(Concatenation("dot ", tmp_name," -T",ext," > ",filename));
	Exec(Concatenation("rm ", tmp_name));
	Exec(Concatenation("xdg-open ",filename, " > /dev/null 2>&1"));
end);
	
