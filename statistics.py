#!/usr/bin/python
from __future__ import division
import re

#f = open('Eoph-dp7-miss0.2-maf0.05.vcf', 'r')
#lines=f.readlines()
#f.close()

snp=[]

f = open('snp_sta.txt', 'w')
with open('Eoph-dp7-miss0.2-maf0.05.vcf') as fs:
	for line in fs:
		if re.search(r'^[^#]', line):
			snp=line.strip().split()
			nsam=len(snp)-9
			for i in range(9, len(snp)-1):
				snp[i]=snp[i].split(':')[0]
			pro1=snp.count('0/0')/nsam
			pro2=snp.count('0/1')/nsam
			pro3=snp.count('1/1')/nsam	
			sta=snp[0]+'\t'+snp[1]+'\t'+str(pro1)+'\t'+str(pro2)+'\n'
			f.write(sta)
