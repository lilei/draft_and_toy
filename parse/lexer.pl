#! /usr/bin/perl
use utf8;
use warnings;
use strict;
use 5.010;

my $str = ($ARGV[0] or  "[ab ,  bc   ]");

my @input = split //,$str;
my $len = @input;
my $offset  = 0;
my $c = $input[0];

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
	while($c ne "<EOF>"){
		if($c eq ','){
			&consume();
			return &Token($COMMA,",");
		}elsif($c eq '['){
			&consume();
			return &Token($LBRACK,"[");
		}elsif($c eq ']'){
			&consume();
			return &Token($RBRACK,"]");
		}elsif($c eq '='){
			&consume();
			return &Token($EQUALS,"=");
		}else{
			if(&isLETTER())	{
				return &NAME();
			}else{
				say "Invalid character $c,$offset";
				return $EOF;
			}
		}			
	}
	return &Token($EOF,"<EOF>");
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
	my $text;
	foreach (@input[$offset .. $#input]){
		if(/[a-zA-Z]/){
			$text .= $_;
			&consume();
			next;
		}else{
			return &Token($NAME,$text);
		}
	}
}

sub WS{
	foreach(@input[$offset .. $#input]){
		if(/\s/){
			&consume();	
		}else{
			return;
		}
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

sub match{
	my $x = $_[0];
	if($c eq $x){
		&consume();
	}
	else{
		say "error,expecting $x,found $c";
	}
}


