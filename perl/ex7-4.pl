#! /usr/bin/perl
use utf8;
use warnings;
use strict;

while(<STDIN>){
	if(/[A-Z]+[a-z]+\s/){
		print $_;
	}
}
