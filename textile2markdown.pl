#!/usr/bin/perl

use Modern::Perl;
use YAML;
use Data::Dumper;
use Smart::Comments;
use File::Temp qw/ tempfile tempdir/;
use autodie;


my @dir_files = <media/*.yaml>;
my @yaml_file = ();
open my $fh, '>:utf8', 'zz.yaml';

foreach my $tmp_file (@dir_files) { ### (% done) $tmp_file
    my $yaml_data=YAML::LoadFile($tmp_file);
 
    my @sections = qw/content heading/;
    foreach my $section (@sections) { 
        if (exists $yaml_data->{$section}) { 
            my $new_content = convert_to_markdown($yaml_data->{$section});
            $yaml_data->{$section} = $new_content;
        }    
    } 

    print $fh YAML::Dump($yaml_data);
}

sub convert_to_markdown {
    
    my ($contents) = @_;
    
    my ($fh, $filename) = tempfile(DIR => 'tmp/');
    binmode $fh, ":utf8";
    print $fh $contents;
    close $fh;
    
    my $new_content = `pandoc -s -S $filename -f textile -t markdown`; 
    unlink $filename;
    return $new_content;
}
