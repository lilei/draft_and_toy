#! /usr/bin/perl
use utf8;
use warnings;
use strict;
use 5.010;

my %hash = (
				fred 	=>  'flintstone',
				barney 	=>	'rubble',
				wilma 	=>	'flintstone');
print "please input a first name\n";


while(<STDIN>){
	chomp;
	if(exists $hash{$_}){
		say $hash{$_};
	}else{
		say "none";
	}
}
