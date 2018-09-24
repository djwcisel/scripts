#!/usr/bin/perl -w
use Bio::SeqIO;

my $infile        = shift;

 my $seq_in = Bio::SeqIO->new(
                             -file   => "<$infile",
                             -format => "fasta");

 
# write each entry in the input file to the output file
while (my $inseq = $seq_in->next_seq) {
    print $inseq->id, "\tlength=",$inseq->length,"\n";
}

#
