#! /usr/bin/perl
use utf8;
use warnings;
use strict;

while(<>){
	chomp;
	if(/(?<word>\w*a\b(?<last>.{1,5}))/){
		print "'word' contains '$+{word},last 5 is '$+{last}''\n";
	}else{
		print "No Match |$_|\n";
	}
}
