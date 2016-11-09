#! /usr/bin/perl
foreach(@ARGV){
	my $val = hex($_);
	printf("ox%x\t=%d\n",$val,$val);
}
