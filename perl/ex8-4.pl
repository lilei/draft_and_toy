#! /usr/bin/perl
use utf8;
use warnings;
use strict;

while(<>){
	chomp;
	if(/(?<word>\w*a)\b/){
		print "'word' contains '$+{word}'\n";
	}else{
		print "No Match |$_|\n";
	}
}
