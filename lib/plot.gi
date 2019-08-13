InstallGlobalFunction(DotCode,
function(X,params)
	local n,M,s,rels,i,e,e1,
	use_names,color_edges,direction_edges,
	current_color,current_dir,escape_string;

	escape_string := s -> ReplacedString(s,"\"","\\\"");

	use_names:=LookupDictionary(params,"use_names");
	if use_names=fail then use_names:=false; fi;

	color_edges:=LookupDictionary(params,"color_edges");
	if color_edges=fail then color_edges:= x-> "black"; fi;

	direction_edges:=LookupDictionary(params,"direction_edges");
	if direction_edges=fail then direction_edges:= x-> "forward"; fi;

	n:=Size(X);
	M:=OrderMatrix(X);
	rels := CoveringRelations(X);
	current_color:="black";
	current_dir:="forward";
	s := "digraph D{\n";
	for i in [1..Size(rels)] do
		e:=rels[i];

		if color_edges(e) <> current_color then
			current_color:=color_edges(e);
			s:=Concatenation(s,"edge [color=",current_color,"];\n");
		fi;

		if direction_edges(e) <> current_dir then
			current_dir:=direction_edges(e);
			s:=Concatenation(s,"edge [dir=",current_dir,"];\n");
		fi;

		if use_names then
			e1:=e;
		else
			e1:=List(e, x->PositionSorted(Set(X),x));
		fi;
		s:=Concatenation(s,"  \"",escape_string(String(e1[1])),"\" -> \"",escape_string(String(e1[2])),"\"\n");
	od;
	s:=Concatenation(s,"}");
	return s;
end);

InstallGlobalFunction(DotCodeToFile,
function(dot_code,filename)
	local out,tmp_name,ext,ps;
	ps:=SplitString(filename,".");
	ext:=ps[Size(ps)];
	tmp_name := Concatenation(filename,".tmp");
	out:=OutputTextFile(tmp_name, false);
	AppendTo(out,dot_code);
	Exec(Concatenation("dot ", tmp_name," -T",ext," > ",filename));
	Exec(Concatenation("rm ", tmp_name));
	Exec(Concatenation("xdg-open ",filename, " > /dev/null 2>&1"));
end);
	

InstallGlobalFunction(PlotHasseDiagram,
function(X,filename)
	local dot_code;
	dot_code:=DotCode(X,NewDictionary("",true));
	DotCodeToFile(dot_code,filename);
end);

InstallGlobalFunction(PlotMorseMatching,
function(X,M,filename)
	local colors,params,dot_code,direction_edges;
	colors:=function(e)
		if e in M then
			return "red";
		else
			return "black";
		fi;
	end;;
	direction_edges:=function(e)
		if e in M then
			return "back";
		else
			return "forward";
		fi;
	end;;
	params:=NewDictionary("",true);
	AddDictionary(params,"color_edges",colors);
	AddDictionary(params,"direction_edges",direction_edges);
	dot_code:=DotCode(X,params);
	DotCodeToFile(dot_code,filename);
end);

