#! /usr/bin/perl
use utf8;
use warnings;
use strict;
use 5.010;

my %name;
while(<STDIN>){
	chomp;
	if($_){
		$name{$_} += 1;
	}else{
		last;
	}
}



foreach(sort keys  %name){
	say $_ . " " . $name{$_};
}
