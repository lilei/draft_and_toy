#! /usr/bin/perl
use utf8;
use warnings;
use strict;
use 5.010;


chomp (my @foo = <STDIN>);

say "1234567890" x 5;
foreach(@foo){
	printf "%20s\n",$_;
}

