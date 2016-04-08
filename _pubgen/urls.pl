#!/usr/bin/perl

use warnings;
use strict;

my %urls = (
    'Christian Pilato' => 'http://www.cs.columbia.edu/~pilato',
    'Giuseppe Di Guglielmo' => 'http://www.cs.columbia.edu/~giuseppe',
    'Hung-Yi Liu' => 'http://sites.google.com/site/hungyiliu',
    'Ken Shepard' => 'http://www.bioee.ee.columbia.edu/~shepard',
    'Kevin Tien' => 'http://www.bioee.ee.columbia.edu/~ktien',
    'Luca P. Carloni' => 'http://www.cs.columbia.edu/~luca',
    'Marcin Szczodrak' => 'http://www.cs.columbia.edu/~msz',
    'Michele Petracca' => 'http://sites.google.com/site/mipetracca',
    'Nicola Concer' => 'http://www.cs.columbia.edu/~concer',
    'Paolo Mantovani' => 'http://www.cs.columbia.edu/~paolo',
    'Young-Yin Yoon' => 'http://www.cs.columbia.edu/~youngjin',
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
