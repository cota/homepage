#!/usr/bin/perl

use warnings;
use strict;

use Text::BibTeX;
use XML::RSS;
use Data::Dumper;
use DateTime;
use DateTime::Format::Mail;

my %months = (
    'jan' => 1,
    'feb' => 2,
    'mar' => 3,
    'apr' => 4,
    'may' => 5,
    'jun' => 6,
    'jul' => 7,
    'aug' => 8,
    'sep' => 9,
    'oct' => 10,
    'nov' => 11,
    'dec' => 12,
    );

die if !@ARGV;
my $filename = $ARGV[0];

my $parser = Text::BibTeX::File->new($filename) or die "cannot process $filename: $!";

my @arr;

while (my $entry = Text::BibTeX::Entry->new($parser)) {
    if ($entry->parse_ok) {
	next if $entry->{type} eq 'string';
	if (defined($entry->{values}->{month})) {
	    $entry->{values}->{month} =~ tr/{//d;
	    $entry->{values}->{month} =~ tr/}//d;
	    $entry->{values}->{month} = lc $entry->{values}->{month};
	    my $str = substr $entry->{values}->{month}, 0, 3;
	    $entry->{mon} = $months{$str} or die "$str";
	} else {
	    $entry->{mon} = $months{jan};
	}
	if (!defined($entry->{values}->{year}) or !defined($entry->{key})) {
	    print Dumper($entry);
	    die;
	}
	my $item;
	my $title = $entry->{values}->{title};
	$title =~ tr /{//d;
	$title =~ tr /}//d;
	$item->{title} = $title;
	$item->{year} = $entry->{values}->{year};
	$item->{month} = $entry->{mon};
	$item->{key} = $entry->{key};
	push @arr, $item;
    } else {
	warn "Error parsing file: " . $entry->error;
    }
}

my @sorted = sort { $a->{year} <=> $b->{year} or
			$a->{month} <=> $b->{month} or
			$b->{title} cmp $a->{title} } @arr;

my $rss = XML::RSS->new(version => '2.0');
$rss->channel(
    title        => 'Emilio G. Cota | Publications by date',
    link         => 'http://www.cs.columbia.edu/~cota',
    description  => 'Publications of Emilio G. Cota',
    );

foreach my $item (reverse @sorted) {
    my $dt = DateTime->new(
	year       => $item->{year},
	month      => $item->{month},
	day        => 1,
	hour       => 0,
	minute     => 0,
	second     => 0,
	nanosecond => 0,
	time_zone  => "floating",
	);

    $rss->add_item(
	title       => $item->{title},
	pubDate => DateTime::Format::Mail->format_datetime($dt),
	link        => -f "pubs/$item->{key}.pdf" ? "http://www.columbia.edu/~cota/pubs/$item->{key}.pdf" : undef,
	);
}

print $rss->as_string;
