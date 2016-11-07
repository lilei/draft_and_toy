#! /usr/bin/perl
use utf8;
use warnings;
use strict;

sub total{
	my $sum = 0;
	foreach(@_){
		$sum += $_;
	}
	$sum;
}

my $sum = total 1 .. 1000;
print "$sum\n"
