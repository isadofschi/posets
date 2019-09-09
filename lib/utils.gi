InstallGlobalFunction(NumberCPUs,
function()
	local tmpdir, filename_out,command,f,number;
	tmpdir := DirectoryTemporary();;
	filename_out:=Filename( tmpdir , "cores" );
	command := Concatenation([ "grep ^cpu\\\\scores /proc/cpuinfo | uniq |  awk \'{print $4}\' > ", filename_out]);
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
	command := Concatenation([ "nproc --all > ", filename_out]);
    Exec(command);
	f:=IO_File(filename_out,"r");
	number:=Int(Chomp(IO_ReadLines(f)[1]));
	IO_Close(f);
	return number;
end );
