#! /usr/bin/perl
use utf8;
use warnings;
use 5.012;

my @foo = qw /a b c d/;
while(my($index,$value) = each(@foo)){
	say "$index,$value";
}
