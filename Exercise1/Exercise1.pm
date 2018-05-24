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
my $prot_obj;
my $fastaSeq = Bio::Seq->new(
    -seq => '',
    -display_id => '',
    -desc => '',
    -alphabet => 'rna'
);

my $fastaFile = Bio::SeqIO->new(
        -file => '>Exercise1.fasta',
        -format => 'fasta'
);


while ($seq = $io->next_seq()) {

    #$fastaSeq->desc($seq->description());
    #$fastaSeq->display_id($seq->accession_number());
    
    if (defined $seq->seq()) {
        
        #$fastaSeq->seq($seq->seq());
        #$fastaFile->write_seq($fastaSeq);
        
        #Reading Frames
        $fastaFile->write_seq($seq->translate(-frame => 0));
        $fastaFile->write_seq($seq->translate(-frame => 1));
        $fastaFile->write_seq($seq->translate(-frame => 2));

        #Reading Frames en el orden inverso del complemento
        $fastaFile->write_seq($seq->revcom(-frame => 0));
        $fastaFile->write_seq($seq->revcom(-frame => 1));
        $fastaFile->write_seq($seq->revcom(-frame => 2));

    }

}



