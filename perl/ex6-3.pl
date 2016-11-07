#! /usr/bin/perl
use utf8;
use warnings;
use strict;
use 5.010;

my $width = 0;
foreach(keys %ENV){
	my $len = length($_);
	if ($len > $width){
		$width = $len;
	}
}

foreach(sort keys %ENV){
	printf "%-${width}s  %s\n",$_,$ENV{$_};
}
