#! /usr/bin/perl
use utf8;
use warnings;
use strict;
use 5.010;

use Point;
package main;
my $p = Point->new();

$p->print();
say $p->x;
say $p->y;
