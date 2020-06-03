#!/bin/sh
awk 'BEGIN{FS="\t";OFS="\t"}{print $1,$2,$2+1}' E092_diff.vcf >E092_diff.bed
