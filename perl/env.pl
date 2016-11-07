#! /usr/bin/perl
use utf8;
use warnings;
use strict;
use 5.010;

while(my ($key,$value) = each %ENV ){
	say $key . ":	" . $value;
}
