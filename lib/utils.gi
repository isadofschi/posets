InstallGlobalFunction(NumberCPUs,
function()
	local tmpdir, filename_out,command,f,number;
	tmpdir := DirectoryTemporary();;
	filename_out:=Filename( tmpdir , "cores" );
	if ARCH_IS_WINDOWS(  ) then
		command := "echo %NUMBER_OF_PROCESSORS%"; #not tested
	else
	command := Concatenation([ "grep ^cpu\\\\scores /proc/cpuinfo | uniq |  awk \'{print $4}\' > ", filename_out]);
	fi;
    Exec(command);
	f:=IO_File(filename_out,"r");
	number:=Int(Chomp(IO_ReadLines(f)[1]));
	IO_Close(f);
	return number;
end );

InstallGlobalFunction(NumberThreads,
function()
	local tmpdir, filename_out,command,f,number;
	tmpdir := DirectoryTemporary();;
	filename_out:=Filename( tmpdir , "tmpOut" );
	if ARCH_IS_WINDOWS(  ) then
		command := "echo %NUMBER_OF_PROCESSORS%"; #not tested
	else
		command := Concatenation([ "nproc --all > ", filename_out]);
	fi;
    Exec(command);
	f:=IO_File(filename_out,"r");
	number:=Int(Chomp(IO_ReadLines(f)[1]));
	IO_Close(f);
	return number;
end );
