#! /usr/bin/perl
use utf8;
use warnings;

print "please input the r of a circle:\n";
chomp ($r = <STDIN>);
if($r < 0){
	$r = 0;	
}

print (($r * 2 * 3.14592654) . "\n");
