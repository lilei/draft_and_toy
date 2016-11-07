#! /usr/bin/perl
use utf8;
use warnings;
print "please input a string and a number:\n";
$str = <STDIN>;
chomp($number = <STDIN>);

print ($str x $number);

