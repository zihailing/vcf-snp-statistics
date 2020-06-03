#!/usr/bin/perl
use strict; use warnings;
use FileHandle;

my($file)=@ARGV;
my $in=FileHandle->new("< $file");

my(@mutant_homo, @wild_homo, @hetero);
my $number=0;
while(<$in>){
	chomp;
	if($_!~/^#/){
		$number++;
		my @arr=split("\t", $_);
		for(my $i=9; $i<@arr; $i++){
			my @indul=split(":", $arr[$i]);
			if($indul[0]=~/0\/0/){
				$wild_homo[$i-9]++;
			}elsif($indul[0]=~/1\/1/){
				$mutant_homo[$i-9]++;
			}else{
				$hetero[$i-9]++;
			}
		}
	}
}

for(my $i=0; $i<@mutant_homo; $i++){
	if(!$mutant_homo[$i]){
		$mutant_homo[$i]=0;
	}
	if(!$hetero[$i]){
		$hetero[$i]=0;
	}
	my $ratio_homo = $mutant_homo[$i]/$number;
	my $ratio_hetero = $hetero[$i]/$number;
	print "$mutant_homo[$i]\t$hetero[$i]\t$wild_homo[$i]\t$ratio_homo\t$ratio_hetero\n";
}
	

