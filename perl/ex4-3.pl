#! /usr/bin/perl
use utf8;
use warnings;
use strict;
use 5.012;

sub average{
	my $sum = 0;
	foreach(@_){
		$sum += $_;
	}
	$sum / @_;
}

sub above_average{
	my $average = average @_;
	my @result;
	while (my ($index,$value) = each(@_)){
		if ($value > $average){
			push @result,$value;
		}
	}
	@result;
}


my @fred = above_average(1 .. 10);
print "\@fred is @fred\n";
print "shulde be (6,7,8,9,10)\n";
my @barney = above_average(100,1..10);
print "\@barney is @barney\n";
print "shulde be (100)\n";

