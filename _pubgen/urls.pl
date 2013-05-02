#!/usr/bin/perl

use warnings;
use strict;

my %urls = (
    'Hung-Yi Liu' => 'https://sites.google.com/site/hungyiliu/',
    'Luca P. Carloni' => 'http://www.cs.columbia.edu/~luca/',
    'Marcin Szczodrak' => 'http://www.cs.columbia.edu/~msz/',
    'Michele Petracca' => 'https://sites.google.com/site/mipetracca/',
    'Nicola Concer' => 'http://www.cs.columbia.edu/~concer/',
    'Paolo Mantovani' => 'http://www.cs.columbia.edu/~paolo/',
    'Young-Yin Yoon' => 'http://www1.cs.columbia.edu/~youngjin/',
    );

die("No input file given\n") if !@ARGV;

open(INPUT, '<', $ARGV[0]) or die $!;

while (<INPUT>) {
    chomp;
    foreach my $author (keys %urls) {
	$_ =~ s|$author|<a href=\\"$urls{$author}\\">$author</a>|;
    }
    print $_, "\n";
}
close(INPUT) or die $!;
