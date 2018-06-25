#!/usr/bin/perl -w

use Bio::Seq;
use Bio::Tools::Run::StandAloneBlastPlus;
use Bio::SeqIO;

#parametros cmd
$num_args = $#ARGV + 1;
if ($num_args != 2) {
    print "\nUsage: Exercise2.pm swissprot.psq Exercise1.fasta\n";
    exit;
}

my $fastaFile = $ARGV[1];
my $inputSeq = Bio::SeqIO->new(-file   => "$fastaFile",
                           -format => 'fasta' );

$factory = Bio::Tools::Run::StandAloneBlastPlus->new( -db_name => $ARGV[0] );

$i=1;
$outputName="Exercise2_blast_";

while (my $seq = $inputSeq->next_seq) {

    $outputFile = "$outputName" . "$i" . ".bls";
    $factory->blastp( -query => $seq,  -outfile => "$outputFile" );

    $i++;

}
