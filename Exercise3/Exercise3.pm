use Bio::Tools::Run::Alignment::Clustalw;

print "Inicio ejercicio 3\n";

system("rm -rf Output");
system("mkdir Output");

@params = ('outfile' => './Output/MSA_Info');
my $fac = Bio::Tools::Run::Alignment::Clustalw->new(@params);

@seq_array =();

$str = Bio::SeqIO->new(-file=> "./Input/seq_1.fasta", -format => 'Fasta');
while ( my $seq = $str->next_seq() ) {push (@seq_array, $seq) ;}

$str = Bio::SeqIO->new(-file=> "./Input/seq_2.fasta", -format => 'Fasta');
while ( my $seq = $str->next_seq() ) {push (@seq_array, $seq) ;}

$str = Bio::SeqIO->new(-file=> "./Input/seq_3.fasta", -format => 'Fasta');
while ( my $seq = $str->next_seq() ) {push (@seq_array, $seq) ;}

$str = Bio::SeqIO->new(-file=> "./Input/seq_4.fasta", -format => 'Fasta');
while ( my $seq = $str->next_seq() ) {push (@seq_array, $seq) ;}

$str = Bio::SeqIO->new(-file=> "./Input/seq_5.fasta", -format => 'Fasta');
while ( my $seq = $str->next_seq() ) {push (@seq_array, $seq) ;}

$str = Bio::SeqIO->new(-file=> "./Input/seq_6.fasta", -format => 'Fasta');
while ( my $seq = $str->next_seq() ) {push (@seq_array, $seq) ;}

$str = Bio::SeqIO->new(-file=> "./Input/seq_7.fasta", -format => 'Fasta');
while ( my $seq = $str->next_seq() ) {push (@seq_array, $seq) ;}

$str = Bio::SeqIO->new(-file=> "./Input/seq_8.fasta", -format => 'Fasta');
while ( my $seq = $str->next_seq() ) {push (@seq_array, $seq) ;}

$str = Bio::SeqIO->new(-file=> "./Input/seq_9.fasta", -format => 'Fasta');
while ( my $seq = $str->next_seq() ) {push (@seq_array, $seq) ;}

$str = Bio::SeqIO->new(-file=> "./Input/seq_10.fasta", -format => 'Fasta');
while ( my $seq = $str->next_seq() ) {push (@seq_array, $seq) ;}

$seq_array_ref = \@seq_array;

my $aln = $fac->align($seq_array_ref);

print "Fin ejercicio 3\n";



