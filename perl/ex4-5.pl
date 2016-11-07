#! /usr/bin/perl
use utf8;
use warnings;
use strict;

my @comed = ();

sub greet{
	print "Hi $_[0] ";
	my $len = @comed;
	if($len  > 0){
		print "I've see:@comed\n";	
	}else{
		print "you are the first one here\n";
	}
	push @comed,$_[0];
}

greet("Fred");
greet("Barney");
greet("Wilma");
greet("Betty");
