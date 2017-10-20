#!/bin/bash
L=600
N=100000
set=0


echo "setOfParam fastaFile locusLength nSegSites populational_rho N_indiv" >info.txt

# loop over the density in SNPs
for segSites in $(seq 5 5 100); do
	# loop over the simulated recombination rate
	for rho in 0 10 20 30 40 50 ; do # 4.N.L.r with N=100,000, L=600
		set=$(($set+1))
		echo set_${set}.txt segSite${segSites}_rho${rho}.fasta ${L} ${segSites} ${rho} ${N} >>info.txt
		# loop over replicates
		for rep in $(seq 1 1 1000); do
			msnsam 8 1 -s ${segSites} -r ${rho} ${L} | ./ms2fasta.py ${L} ${rep} ${set} >> segSite${segSites}_rho${rho}.fasta
		done # end of loop over replicates
		RNAseqFGT segSite${segSites}_rho${rho}.fasta set_${set}.txt
	done # end of loop over rho
done # enf of loop over S


