#! /usr/bin/perl
use utf8;
use warnings;
use strict;

while(<>){
	chomp;
	if(/(\w*a)\b/){
		print "\$1 contains '$1'\n";
	}else{
		print "No Match |$_|\n";
	}
}
