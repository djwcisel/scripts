#!/usr/bin/perl -w

use Bio::Tools::GFF;
use List::MoreUtils qw(uniq);

my $gff_file = $ARGV[0];

#my $range_start = 20000000;
#my $range_end   = 21000000;

#my @gene_names = ();


my $gffio = Bio::Tools::GFF->new(-file => $gff_file, -gff_version => 3);

while (my $feature = $gffio->next_feature()) {
   
if ($feature->primary_tag() eq 'CDS'){
     $product_names = join ("\t", $feature->get_tag_values('gene'),$feature->get_tag_values('product'));
     push @product_extractor, $product_names;
   }

if ($feature->primary_tag() eq 'gene'){
     $gene_extractor = join ("\t", $feature->get_tag_values('gene'), $feature->get_tag_values('Dbxref'), $feature->start(), $feature->strand());
     push @gene_extractor, $gene_extractor;
   }
}


my @uni_product_extractor = uniq @product_extractor;
my @uni_gene_extractor = uniq @gene_extractor;

#foreach (@uni_product_extractor){
#   print "$_\n";
#}
#foreach (@uni_gene_extractor){
#   print "$_\n";
#}

foreach (@uni_product_extractor){ ## LOC000000000 \t product
   my $named = $_;
   if ($named =~ /(^.*\t)/){ #searches for $feature->get_tag_values('gene')
        $matched = $1;
      foreach (@uni_gene_extractor){ ## LOC00000000 \t gene_biotype \t gene start \t strand
        if ($_ =~ /$matched/){
           $combined = join ("\t", $named, $_);
           push @combined, $combined;
         }
      }
   }
}

foreach (@combined){
     $_ =~ /(GeneID:\S*)/;
	push @gene_names, $1;
}

my @unique_gene_names = uniq @gene_names;

foreach (@unique_gene_names) {
   my $search = $_;
   my ($first_hit) = grep {/$search/} @combined;
   print "$first_hit\n";
}












