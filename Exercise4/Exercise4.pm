#!/usr/bin/perl -w

use Bio::SearchIO;
use Bio::SeqIO;
use Bio::Seq;
use Bio::Perl;
use Bio::Tools::Run::StandAloneBlastPlus;
use Data::Dump qw(dump);

$num_args = $#ARGV + 1;
if ($num_args != 2) {
    print "\nUsage: Exercise4.pm blastFile.bls PatronDeseado\n";
    exit;
}

my $inputBlast = $ARGV[0];
my $inputPatron = $ARGV[1];
my $outputName;
my $outputNamefna;
my $seq;

my $report_obj = new Bio::SearchIO( -file   => "$inputBlast", -format => 'blast' );

while($result = $report_obj->next_result ){
	
    while($hit = $result->next_hit) {

			if (index($hit->description, "$inputPatron") != -1){
               
                print " \n Hit: ", $hit->name;
				print "\n Descripcion: ", $hit->description;
                print "\n Accession: ", $hit->accession ."\n";      

                $outputName = $hit->accession;			
                $seq = get_sequence('genbank', "$outputName");
                $outputNamefna = $outputName . '.fna';
                write_sequence(">$outputNamefna", 'fasta', $seq);
                
            }

	}

}

print "\nFin ejercicio 4\n";