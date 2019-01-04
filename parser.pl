use Data::Dumper;
use JSON;

$filename = 'products_list.txt';
open(my $fh, '<', $filename)
  or die "Could not open file";

my %output;
my $context;

my $line;
while ($row = <$fh>) {
  $line++;
  chomp $row;

  if (index($row, '## ') != -1) {
    $row =~ s/^## //;
    $context = lc $row;

    $output{$context} = [];
  } elsif (!$row) {
    push $output{$context}, {};
  } else {
    my ($key, $value) = split(/: /, $row);
    $value =~ s/("|')//g;
    chomp $value;

    $output{$context}[-1]{$key} = $value;
  }
}
close $fh;

$json = JSON->new->allow_nonref;
my $jsonOutput = $json->pretty->encode(\%output);

# Fix indentation
$jsonOutput =~ s/ "/"/g;
$jsonOutput =~ s/ ]/]/g;

open($fh2, '>', 'parser_output.json') or die $!;
print $fh2 $jsonOutput;
close $fh2;