#! /usr/bin/perl
use utf8;
use warnings;
@names = qw /fred betty barney dino wilma pebbles bamm-bamm /;
print "please input the numbers:\n";
@numbers = <STDIN>;

$len = @names;

foreach(@numbers){
	if($_ > $len){
		print("undef ");
	}else{
		print "$names[$_ -1]\n";
	}
}
print "\n";

