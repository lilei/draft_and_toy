#! /usr/bin/perl
use utf8;
use warnings;
use strict;
use 5.010;

my %hash = qw /a 1 b 2 c 3/;

say %{hash};

my @array = %hash;

say "@array";
