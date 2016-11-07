#! /usr/bin/perl
use utf8;
use warnings;
use strict;

my $last = undef;

sub greet{
	print "Hi $_[0] ";
	if(defined($last)){
		print "$last is also here\n";	
	}else{
		print "you are the first one here\n";
	}
	$last = $_[0];
}

greet("Fred");
greet("Barney");
