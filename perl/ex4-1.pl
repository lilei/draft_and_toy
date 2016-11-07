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

my @fred = qw{1 3 5 7 9};
my $fred_total = total(@fred);
print "the total of \@fred is $fred_total\n";
print "please input some numbers:\n";
my $usr_total = total(<STDIN>);
print "the total of those numbers is $usr_total";
