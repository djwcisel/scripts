#!/usr/bin/perl -w

$filename = 'Danio_rerio.Zv9.dna.chromosome.1.fa';

open(CHR1, $filename);

@chr1 = <CHR1>;
close CHR1;
chomp @chr1;

$chr1 = join('', @chr1);

print ">chr1_58415260-58415760\n", substr($chr1, 58415260, 500), "\n";

