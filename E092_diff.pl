#!/usr/bin/perl
use strict; use warnings;
use FileHandle;

my($file)=@ARGV;
my $in=FileHandle->new("< $file");

while(<$in>){
	chomp;
	if($_!~/^##/){
		my @arr=split("\t", $_);
		my @arr1=split(":", $arr[87]);
		my @arr2=split(":", $arr[91]);
		if($arr1[0] ne $arr2[0]){
			print "$_\n";
		}
	}
}

