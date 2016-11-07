#! /usr/bin/perl
use utf8;
use warnings;
use strict;

while(<>){
	chomp;
	if(/YOUR PATTERN HERE/){
		print "Matched |$`<$&>$'|\n";
	}else{
		print "No Match |$_|\n";
	}
}
