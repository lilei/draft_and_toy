#! /usr/bin/perl
use utf8;
use warnings;

@lines = sort  <STDIN>;

print "-----------------\n";

print @lines;

print "-----------------\n";

chomp @lines;

print "@lines\n";

