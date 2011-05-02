
@mf_elms = ("all:");

print "opening file ./original_rise.sp\n";
$file_name = './original_rise.sp';
open(ORIG_RISE, $file_name);
@orig_rise_lines = <ORIG_RISE>;
close(ORIG_RISE);

print "opening file ./original_fall.sp\n";
$file_name = './original_fall.sp';
open(ORIG_FALL, $file_name);
@orig_fall_lines = <ORIG_FALL>;
close(ORIG_FALL);

@new_rise_lines = @orig_rise_lines;
@new_fall_lines = @orig_fall_lines;

print "\nUSAGE:\n";
print "enter the parameter u want to change when asked \"Which parameter?\"\n";
print "eg: rr_p (case insensitive)\n";
print "enter \"end\" when u r finished\n";
print "for each search result, enter the value u want to change into when\n";
print "asked \"u want to change it to?\"\n";
print "eg: 1m\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";

print "program starts here!!!\n";
do {
	print "Which parameter? ";
	$parameter = <STDIN>;
	chop $parameter;
	$find = 0;
	do {
		for ($i=24;$i<62;$i++) {
			if ($orig_rise_lines[$i] =~ /$parameter/i) {
				print $orig_rise_lines[$i];
				print "u want to change it to? ";
				$value = <STDIN>;
				@temp_words = split(/ /, $orig_rise_lines[$i]);
				pop(@temp_words);
				push(@temp_words, $value);
				$new_rise_lines[$i] = join(" ", @temp_words);
				$new_fall_lines[$i] = join(" ", @temp_words);
				$find++;
				
				print $new_rise_lines[$i];
			}
		}
		if ($find == 0) {
			print "failed to find parameter: $parameter !!!\n";
		}
		print "Which parameter? ";
		$parameter = <STDIN>;
		chop $parameter;
	} while ($parameter ne "end");

	print "pls enter a name for this analysis: ";
	$analysis_name = <STDIN>;
	chop $analysis_name;
	
	push(@mf_elms, "$analysis_name"."_rise", "$analysis_name"."_fall");
	
	$file_name = "./"."$analysis_name"."_rise.sp";
	open(NEW_RISE, ">$file_name");
	print NEW_RISE "@new_rise_lines";
	close(NEW_RISE);

	$file_name = "./"."$analysis_name"."_fall.sp";
	open(NEW_FALL, ">$file_name");
	print NEW_FALL "@new_fall_lines";
	close(NEW_FALL);
	
	print "continue to generate another file? ";
	$continue = <STDIN>;
	chop $continue;
} while ($continue ne "no");

print "generating makefile................\n";
$file_name = "./makefile";
open(MAKEFILE, ">$file_name");
print MAKEFILE "@mf_elms ";

for ($i=1;$i<=$#mf_elms;$i++) {
	print MAKEFILE "\n\n$mf_elms[$i]: \n";
	print MAKEFILE "\thspice "."$mf_elms[$i]".".sp;";
}
close(MAKEFILE);
print "SUCCESS!!!";

#NOTES:
#open(INFO, $file);	# Open for input
#open(INFO, ">$file");	# Open for output
#open(INFO, ">>$file");	# Open for appending
#open(INFO, "<$file");	# Also open for input
