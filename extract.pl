#!/usr/bin/perl -w
use Bio::DB::Fasta;

my $fastaFile = $ARGV[0];
my $queryFile = $ARGV[1];

my $db = Bio::DB::Fasta->new( $fastaFile );
open (IN, $queryFile);
while (<IN>){
    chomp; 
    $seq = $_;
    my $sequence = $db->seq($seq);
    if  (!defined( $sequence )) {
            die "Sequence $seq not found. \n" 
    }   
    print ">$seq\n", "$sequence\n";
}



