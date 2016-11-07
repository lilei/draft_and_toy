#! /usr/bin/perl
use utf8;
use warnings;
use strict;

while(<STDIN>){
	if(/[Ff]red/){
		print $_;
	}
}
