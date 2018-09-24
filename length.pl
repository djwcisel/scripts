use strict;
use warnings;
use Bio::SeqIO;

my $in = Bio::SeqIO->new( -file => shift, -format => 'Fasta' );

while ( my $seq = $in->next_seq() ) {
    print length($seq->seq) "\n"
      if $seq->seq !~ /n{13,}/i;
}
