#! /usr/bin/perl
use utf8;
use warnings;
use strict;

while(<STDIN>){
	if(/fred/){
		print $_;
	}
}
