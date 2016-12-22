#! /usr/bin/perl
use utf8;
use warnings;
use strict;
use 5.010;

my $str = "return x+1;";
my @str = split //,$str;
my $offset  = 0;


&stat($str);


sub stat(){
	&returnstat();
	say "match  stat";
}

sub returnstat(){
	&match("return");&expr("");&match(";");
	say "match  return stat";
}

sub expr(){
	&match("x");&match("+");&match("1");
	say "match  expr";
}


sub match{
	my @token = split //,$_[0];
	my $len = @token;
	
	for my $i(0 .. $len - 1){
		if($str[$offset + $i] ne $token[$i]){
			say "unmatch $_[0]";
			return 0;
		}
	}
	$offset += $len;
	return 1;
}


