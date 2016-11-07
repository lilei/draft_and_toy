#! /usr/bin/perl
use utf8;
use warnings;
use strict;
use 5.010;

say "please input the width:";
chomp (my $width = <STDIN>);

say "please input the words:";
chomp(my @foo = <STDIN>);

say "1234567890" x ($width /10 + 1);
foreach(@foo){
	printf "%${width}s\n",$_;
}

