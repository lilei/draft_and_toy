#! /usr/bin/perl
use utf8;
use warnings;
use strict;

while(<>){
	chomp;
	if(/\w*a\b/){
		print "Matched |$`<$&>$'|\n";
	}else{
		print "No Match |$_|\n";
	}
}
