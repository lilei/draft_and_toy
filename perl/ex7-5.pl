#! /usr/bin/perl
use utf8;
use warnings;
use strict;

while(<STDIN>){
	if(/(\S)\1/){
		print $_;
	}
}
