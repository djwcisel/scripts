#!/usr/bin/perl -w

### writen by Dustin Wcisel on 3/29/2019
### this script takes in a fasta file containing only one sequence and returns a fasta file
### containing sequence of defined coordinates
### use: perl substring.pl Danio_rerio.GRCz10.dna.chromosome.1.fa 56968494 56968513

my $filename = $ARGV[0] or die "use: substring.pl sequence.fasta LEFT_COORD RIGHT_COORD\n";
my $sub_left = $ARGV[1];
my $sub_right = $ARGV[2];
my $base_pairs = $sub_right-$sub_left;

$sub_left = $sub_left-1; #perl starts at 0

open(DNA, $filename);

while (<DNA>) { #this loop is necessary to remove any all blank lines, newlines, and the fasta header
	next if ($_ =~ /^>/); #ignores the line with the sequence name
	next if ($_ =~ /^\s*$/ ); #ignores any all blank lines
	chomp;
	push @dna, $_;
}

my $dna = join ('', @dna);

my $substring = substr($dna, $sub_left, $base_pairs);

print ">substring\n";

for $print_format ($substring =~ m/.{1,60}/gs) {
	print $print_format, "\n";
}
