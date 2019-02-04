#!/usr/bin/perl

use warnings;
use strict;

die("No input file given\n") if !@ARGV;

open my $fh, '<', $ARGV[0] or die "cannot open file $ARGV[0]: $!";
chomp(my @lines = <$fh>);
close $fh or die $!;

my %urls = (
    'Hung-Yi Liu' => 'http://sites.google.com/site/hungyiliu',
    'Luca P. Carloni' => 'http://www.cs.columbia.edu/~luca',
    'Marcin Szczodrak' => 'http://www.cs.columbia.edu/~msz',
    'Michele Petracca' => 'http://sites.google.com/site/mipetracca',
    'Nicola Concer' => 'http://www.cs.columbia.edu/~concer',
    'Paolo Mantovani' => 'http://www.cs.columbia.edu/~paolo',
    'Young-Yin Yoon' => 'http://www.cs.columbia.edu/~youngjin',
    'YoungHoon Jung' => 'http://www.cs.columbia.edu/~jung',
    'Johnnie Chan' => 'http://www.cs.columbia.edu/~johnnie/',
    'Rebecca Collins' => 'http://www.cs.columbia.edu/~rlc2119/',
    'Christian Pilato' => 'http://www.cs.columbia.edu/~pilato/',
    'Giuseppe Di Guglielmo' => 'http://www.cs.columbia.edu/~giuseppe/',
    'Luca Piccolboni' => 'http://www.cs.columbia.edu/~piccolboni/',
    'Davide Giri' => 'http://www.cs.columbia.edu/~davide_giri/',
    'Jihye Kwon' => 'http://www.cs.columbia.edu/~jihyekwon/',
    );

my %seen;

for (my $i = 0; $i < @lines; $i++) {
    # author URLs
    foreach my $author (keys %urls) {
	$lines[$i] =~ s|$author|<a href="$urls{$author}">$author</a>|;
    }

    # s/h2/h3/ for each year, plus keep track of what years show up
    if ($lines[$i] =~ s|<h2 class="bibliography">([0-9]+)</h2>|<div id="$1"><h3>$1</h3></div>|g) {
	$seen{$1} = 1;
    }

    if ($lines[$i] =~ m/<div id="subsubmenu">/) {
	# at this point all the pubs have shown up already
	my @years = reverse sort { $a <=> $b } keys %seen;
	if (@years) {
	    my @arr;

	    push @arr, "<h5>by year:</h5>";
	    push @arr, "<ul>";
	    push @arr, map { "<li><a href=\"#$_\">$_</a></li>" } @years;
	    push @arr, "</ul>";
	    splice @lines, $i+1, 0, @arr;
	    last;
	}
    }
}


print join("\n", @lines), "\n";

=pod
    if (s|<h2 class="bibliography">([0-9]+)</h2>|<div id="$1"><h3>([0-9]+)</h3></div>|g) {
	$seen{$1} = 1;
    }
=cut
