#!/usr/bin/perl -w

use Bio::SeqIO;

my $genbank = $ARGV[0];
my $queryFile = $ARGV[1];
open (QUERY, $queryFile);

my @query = <QUERY>;
for (@query) {
my $query = $_;
chomp $query;
		
my $seqio_object = Bio::SeqIO->new(-file => "$genbank", -format => "genbank");

while ($seq_object = $seqio_object->next_seq) {

if ($seq_object->accession() eq $query){
for my $feat_object ($seq_object->get_SeqFeatures) {
    if ($feat_object->primary_tag eq "source") {     
        if ($feat_object->has_tag('chromosome')) {
            for my $val ($feat_object->get_tag_values('chromosome')) { 
		#if ($val eq $query){
		print ">",$seq_object->accession(),"_",$seq_object->description(),"_",$val,"\n";
 		print $feat_object->spliced_seq->seq,"\n";
		
			}
	            }
	        }
	    }
	}
    }
}

