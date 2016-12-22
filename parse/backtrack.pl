#! /usr/bin/perl
use utf8;
use warnings;
use strict;
use 5.010;


my $EOF     = 1;
my $NAME    = 2;
my $COMMA   = 3;
my $LBRACK  = 4;
my $RBRACK  = 5;
my $EQUALS	= 6;
my @tokenNames = qw#n/a  <EOF> NAME COMMA  LBRACK RBRACK EQUALS#;


my $input = ($ARGV[0] or  "[a,b]=[c,d]");
my @type;
my @text;

my $offset = 0;
my @look_ahead;
my @look_ahead_text;
my @markers;
my $p = 0;

my @lines = `./lexer.pl '$input'`;
foreach(@lines){
	if(/<'(.*)',(.*)>/){
		push @text,$1;
		push @type,$2;
	}
 }


for my $i(0 .. $k - 1){
	&consume();
}
&list();


sub consume{
	$look_ahead[$p] = $type[$offset];
	$look_ahead_text[$p] = $text[$offset];
	$p = ($p + 1) % $k;
	$offset++;
}

sub match{
	my $type = $_[0];
	if(&LA(1) == $type){
		&consume();
	}else{
		say "expecting $tokenNames[$type],found '" .  &LT(1) . "'";	
	}
	
}

sub LA{
	my $i = $_[0];
	return $look_ahead[($p + $i -1) % $k];
}

sub LT{
	my $i = $_[0];
	return $look_ahead_text[($p + $i -1) % $k];
}


sub list{
	&match($LBRACK);
	&elements();
	&match($RBRACK);
}


sub elements{
	&element();	
	while(&LA(1) == $COMMA){
		&match($COMMA);
		&element();
	}
}

sub element{
	if(&LA(1) == $NAME && &LA(2) == $EQUALS){
		&match($NAME);
		&match($EQUALS);
		&match($NAME);
	}elsif(&LA(1) == $NAME){
		&match($NAME);
	}elsif(&LA(1) == $LBRACK){
		&list();
	}else{
		say "expecting NAME or LBRACK;found '" .  &LT(1) . "'";
	}
}


