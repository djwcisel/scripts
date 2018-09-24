#!/usr/bin/perl -w

$filename = 'GRCz10_chr1.fasta';

open(CHR1, $filename);

@chr1 = <CHR1>;
close CHR1;
chomp @chr1;

$chr1 = join('', @chr1);

#print length($chr1);

#assign a value to x, whatever blast identifies
$hitlocation = 56972521;
$remove_from_start = $hitlocation - 50000;
#initialize while loops
$i = 0;
$h = 0;

#remove the ass-end first

$remove = $hitlocation + 300000;
$remove_from_end = length($chr1)-$remove;
$backwards = reverse $chr1;
while ($h != $remove_from_end){

$backwards =~ s/^.//;
$h++;
}
#print "\n", length($backwards);

$truncated_chr1 = reverse $backwards;

while ($i != $remove_from_start){
$truncated_chr1 =~ s/^.//; 
$i++;
}
#print "\n", length($truncated_chr1), "\n";
print ">GRCz10_chr1_NILT_area", "\n";
print $truncated_chr1;


