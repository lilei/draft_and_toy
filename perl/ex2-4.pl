#! /usr/bin/perl
use utf8;
use warnings;
print "please input the first number:\n";
chomp ($first = <STDIN>);
print "please input the second number:\n";
chomp ($second = <STDIN>);

print ($first * $second) . ".n";
