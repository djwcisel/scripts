#!/usr/bin/perl -w

use Bio::Seq;
use Bio::SearchIO; 
use List::MoreUtils qw(uniq);

#this script parses a blast file and returns only the names of the hits.
#use in combination with extract.pl to retrieve .fasta of blast hits.

$file = $ARGV[0];

my $in = new Bio::SearchIO(-format => 'blast', 
                           -file   => $file);
while( my $result = $in->next_result ) {
  ## $result is a Bio::Search::Result::ResultI compliant object
  while( my $hit = $result->next_hit ) {
    ## $hit is a Bio::Search::Hit::HitI compliant object
    while( my $hsp = $hit->next_hsp ) {
      ## $hsp is a Bio::Search::HSP::HSPI compliant object
     push @names, $hit->name;
  }
 }
}

@unique_words = uniq @names;

foreach (@unique_words){
     print "$_\n";
}




