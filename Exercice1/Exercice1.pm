#!/usr/bin/perl -w
#
# Process sequences from GenBank to FASTA
#

use Bio::SeqIO;
use Bio::Seq;
use strict;
use warnings;
use 5.0100;

my $io = Bio::SeqIO->new (
    -file => "sequence.gb",
    -format => "genbank"
);

my $seq;
my $fastaSeq = Bio::Seq->new(
    -seq => '',
    -display_id => '',
    -desc => '',
    -alphabet => 'dna'
);

while ($seq = $io->next_seq()) {
    $fastaSeq->desc($seq->description());
    $fastaSeq->display_id($seq->accession_number());
    
    if (defined $seq->seq()) {
        $fastaSeq->seq($seq->seq());
    }

    
}

my $fastaFile = Bio::SeqIO->new(
        -file => '>'.$fastaSeq->display_id().'.fasta',
        -format => 'fasta'
);

$fastaFile->write_seq($fastaSeq);
