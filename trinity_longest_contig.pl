#!/usr/bin/perl -w
use strict;
use Bio::SeqIO;

my $infile = shift;

my $seq_in = Bio::SeqIO->new(
                            -file   => "<$infile",
                            -format => "fasta");

my %hash = (); #initial the hash
my %saved_hash = ();

# write each entry in the input file to the output file
while (my $inseq = $seq_in->next_seq) {
	my $seqid = $inseq->id;
	my $length = $inseq->length;
	$seqid =~ m/(\d+_comp\d+)/;
	my $master_id = $1;
#    print "$master_id\n";

	%hash = (
		$master_id => [$seqid, $length]
	);
	%saved_hash = (%saved_hash, %hash); #replaces the previous entry if new entry is longer
										#this currently depends on having ordered data...
}


foreach my $key ( keys %saved_hash ) {
	print "$key: @{ $saved_hash{$key} }\n";
}
