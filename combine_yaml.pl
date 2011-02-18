#!/usr/bin/perl

use Modern::Perl;
use YAML;
use Data::Dumper;
use Smart::Comments;
use File::Temp qw/ tempfile tempdir/;
use autodie;


my @dir_files = <media/*.yaml>;
my @yaml_file = ();
open my $fh, '>:utf8', 'output.yaml';

foreach my $tmp_file (@dir_files) { ### (% done) $tmp_file
    my $yaml_data=YAML::LoadFile($tmp_file);
 
    print $fh YAML::Dump($yaml_data);
}

