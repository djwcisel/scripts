#!usr/bin/perl -w

use Bio::Seq;
use Bio::Tools::Run::BlastPlus;
use Bio::Tools::Run::StandAloneBlastPlus;
use Bio::Tools::Run::StandAloneBlastPlus::BlastMethods;



#make the database

$fac = Bio::Tools::Run::StandAloneBlastPlus->new(
  -db_name => 'GRCz10_chr1.fasta',
  -db_data => 'GRCz10_chr1.fasta',
  -create => 1
);

$fac->make_db();

#$fac = Bio::Tools::Run::StandAloneBlastPlus->new(
#   -db_name => 'xenopus.pep.all.fa'
#);

#$result = $fac->blastx( -query => 'ps_scan.hits.fa' );
