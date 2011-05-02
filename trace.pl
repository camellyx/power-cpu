$core_num = 128;

$file_name = "./edge_detect-6M-$core_num.trace";
open(TRACE, $file_name);
@trace = <TRACE>;
close(TRACE);

$cycles = ($#trace)/$core_num;

for ($i=0;$i<$core_num;$i++) {
	$file_name = "./core$i.trace";
	open(CORES, ">$file_name");
	print CORES $trace[0];
	for ($j=0;$j<$cycles;$j++) {
		print CORES $trace[$core_num*$j+$i+1];
	}
	close(CORES);
}
