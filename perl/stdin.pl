#! /usr/bin/perl
use utf8;
#use warnings;
#use diagnostics;

$str = <STDIN>;
while(defined($str)){
	print $str;
	$str = <STDIN>;
}

if($str == undef){
	print "undef" . "\n";
}

