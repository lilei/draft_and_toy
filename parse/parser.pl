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
my @tokenNames = qw#n/a  <EOF> NAME COMMA  LBRACK RBRACK#;


my $input = ($ARGV[0] or  "[a ,  b]");
my @type;
my @text;

my $look_ahead = 0;

my @lines = `./lexer.pl '$input'`;
foreach(@lines){
	if(/<'(.*)',(.*)>/){
		push @text,$1;
		push @type,$2;
	}
 }

=pod
for my $i(0 .. $#type){
	print "$type[$i]\t$text[$i]\n";
}
=cut
	
&list();


sub consume{
	if($look_ahead < $#type){
		$look_ahead++;	
	}
}

sub match(){
	my $type = $_[0];
	if($type[$look_ahead] == $type){
		&consume();
	}else{
		say "expecting $tokenNames[$type],found $text[$look_ahead]";	
	}
}



sub list{
	&match($LBRACK);
	&elements();
	&match($RBRACK);
}


sub elements{
	&element();	
	while($type[$look_ahead] == $COMMA){
		&match($COMMA);
		&element();
	}
}

sub element{
	if($type[$look_ahead] == $NAME){
		&match($NAME);
	}elsif($type[$look_ahead] == $LBRACK){
		&list();
	}	
	else{
		say "expecting NAME or LBRACK;found $text[$look_ahead]";
	}
}


