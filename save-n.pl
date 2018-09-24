use strict;
use warnings;
use Bio::SeqIO;

my $in = Bio::SeqIO->new( -file => shift, -format => 'Fasta' );

while ( my $seq = $in->next_seq() ) {
    if ($seq->seq =~ /n$/i){
	print '>' . $seq->id . ' ' . $seq->desc . "\n" . $seq->seq . "\n";
      }
}
