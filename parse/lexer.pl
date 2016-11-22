#! /usr/bin/perl

=pod
list			: '[' elements ']';
elements	: element (',' element)+;
element		: NAME | list;
NAME		: (a .. z | A .. Z)+;
=cut

use utf8;
use warnings;
use strict;
use 5.010;

my $str = ($ARGV[0] or  "[ab ,  bc,lilei   ]");

my @input = split //,$str;
my $len = @input;
my $offset  = 0;		#当前偏移量
my $c = $input[0];  #向前看词法单元

my $EOF 	= 1;
my $NAME 	= 2;
my $COMMA 	= 3;
my $LBRACK 	= 4;
my $RBRACK 	= 5;
my $EQUALS	= 6;


my @tokenNames = qw#n/a  <EOF> NAME COMMA  LBRACK RBRACK EQUALS#;

while(&nextToken() != $EOF ){
}

sub nextToken(){
	if($c =~ /\s/){
		&WS();
	}
	if($c eq "<EOF>"){
		return &Token($EOF,"<EOF>");
	}
	if($c eq ','){
		&consume();
		return &Token($COMMA,",");
	}
	if($c eq '['){
		&consume();
		return &Token($LBRACK,"[");
	}
	if($c eq ']'){
		&consume();
		return &Token($RBRACK,"]");
	}
	if($c eq '='){
		&consume();
		return &Token($EQUALS,"=");
	}
	if(&isLETTER())	{
		return &NAME();
	}

	say "Invalid character $c,$offset";
	return $EOF;
}

sub isLETTER{
	return $c =~ /[a-zA-Z]/;
}

sub Token{
	my $type = $_[0];
	my $text = $_[1];
	#say "<'$text',$tokenNames[$type]>";
	say "<'$text',$type>";
	return $type;
}

sub NAME{
	my $text = $c;
	while ($c =~ /[a-zA-Z]/) {
		&consume();
		$text .= $c
	}
	return &Token($NAME,$text)
}

sub WS{
	while ($c =~ /\s/) {
		&consume();
	}
}

sub consume{
	$offset++;
	if($offset >= $len){
		$c = "<EOF>";
	}else{
		$c = $input[$offset];
	}
 }
