#!/usr/bin/perl -w

use strict;
use Encode::Guess;

my $file =$ARGV[0];

open(FH,$file);
binmode(FH);

if(read(FH, my $fread, 500)) {
    my $enc = guess_encoding($fread);
    if(ref($enc)) {
        if ($enc->name eq 'ascii') {
            print "Ascii.\n";
        }
        elsif ($enc->name eq 'UTF-16BE') {
            print "UTF-16 = ???\n";
        }
        elsif ($enc->name eq 'UTF-32LE') {
            print "UTF-32 = Excel file ?\n";
        }

        print "type: ",$enc->name,"\n";
    }
    else {
        print "$file encoding unknown.\n";
    }
}

close(FH);
