#!/usr/bin/perl -w

use Bio::Seq;
use Bio::Tools::Run::StandAloneBlastPlus;
use Bio::SeqIO;

# Leo del archivo que contiene todas las secuencias
my $file = "Exercise1" . ".fasta";
my $inseq = Bio::SeqIO->new(-file   => "$file",
                           -format => 'fasta' );

# Creo el factory para blastp
$fac = Bio::Tools::Run::StandAloneBlastPlus->new(
 -db_name => '/home/bioinformatica/Escritorio/swissprot/swissprot.psq' 
 );

$i=1;
$salida="blast_";

while (my $seq = $inseq->next_seq) {

# Defino archivo de salida por cada secuencia
$out = "$salida" . "$i" . ".bls";

# Crea y reescribe archivo que contiene la secuencia a analizar
#$secuencia = $seq->seq;
#$seq_fasta = Bio::SeqIO->new(-file => ">tmp_ej2a.fas",
#                                -format => 'fasta');
#$seq_fasta->write_seq($seq);

$fac->blastp( -query => $seq,  -outfile => "$out" );

$i = $i + 1;
}
