#!/usr/bin/perl -w

open (FILE1, $ARGV[0]); #file to find
open (FILE2, $ARGV[1]); #file to search






@find = <FILE1>;
@line = <FILE2>;

for (@find){

$find = $_;
chomp $find;

@grepped = grep m/$find/, @line;
print @grepped;
}


#$find = "NM_001007570";

#@line = <FILE2>;
#@grepped = grep /$find/, @line;
#print @grepped;



#my $find = "NM_001001130";

#my @line = <FILE2>;
#print "Line that matched $find\n";
#for (@line) {
#    if ($_ =~ /$find/) {
#        print "$_\n";
#    }
#}
