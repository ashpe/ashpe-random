my $string = "program_theatre_future";
my $string2 = "program_other_now";
my $string3 = 'p12';

my $future = substr $string, -6;
my $now = substr $string2, -3;
my $temp = substr $string3, 1, length($string3);

print "$future\n$now\n$temp";
