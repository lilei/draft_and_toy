#! /usr/bin/perl
use utf8;
use warnings;
use strict;
my @items = qw /alice bob cindy/;
my $format = "The items are:\n" . ("%10s\n" x @items);

printf $format,@items;

printf "The items are:\n" .("%10s\n" x @items),@items;

