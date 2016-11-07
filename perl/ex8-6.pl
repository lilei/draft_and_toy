#! /usr/bin/perl
use utf8;
use warnings;
use strict;

while(<>){
	chomp;
	if(/\s+\Z|\A\Z/){
		print "$_<end>\n";
	}
}
