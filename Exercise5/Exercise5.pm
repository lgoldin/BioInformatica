#!/usr/bin/perl -w
#use warnings;
#use Data::Dump qw(dump);
use Bio::Seq;
use Bio::SeqIO;
use Bio::Factory::EMBOSS;

$num_args = $#ARGV + 1;
if ($num_args != 1) {
    print "\nUsage: Exercise5.pm Exercise1.fasta\n";
    exit;
}

my $seq;
my $seq_obj=$ARGV[0];
my $outfileorf = "Exercise5_orfs.fasta";
my $outfilepat = "Exercise5_patmatmotifs.fasta";

$factory = new Bio::Factory::EMBOSS; 

#GETOFR
$seqorfapp = $factory->program('getorf'); 

%inputorf = ( -sequence => $seq_obj,  -table => 1, -outseq => $outfileorf );

$seqorfapp->run(\%inputorf); #ejecutar cmd

#PATMATMOTIFS
$seqpatapp = $factory->program("patmatmotifs");

%inputpat = ( -sequence => $seq_obj, -full => 'Y', -outfile => $outfilepat );

$seqpatapp->run(\%inputpat); #ejecutar cmd