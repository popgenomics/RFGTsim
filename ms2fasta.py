#!/usr/bin/python

import sys
L = int(sys.argv[1])
locus = sys.argv[2]
species = sys.argv[3]

def getPositions(line, L):
	tmp = line.strip().split(" ")[1:]
	res = [ int(round(float(i)*L))-1 for i in tmp ]
	return(res)


def getAncestral(nInd, L):
	res = []
	for i in range(nInd):
		res.append(["A"]*L)
	return(res)


def getMutations(positions, ms, alignment, nInd):
	for i in range(nInd):
		cnt = 0
		for j in ms[i]:
			if j=="1":
				alignment[i][positions[cnt]] = "G"
			cnt += 1		
	return(alignment)


cnt = 0

ms = []
for line in sys.stdin:
	cnt += 1
	if cnt==6:
		positions = getPositions(line, L) 
	if cnt>6:
		ms.append(line.strip())

nInd = len(ms)
alignment = getAncestral(nInd, L)
mutations = getMutations(positions, ms, alignment, nInd)


###
res = ""
ind=1
allele=0
cnt=0
for i in range(len(mutations)):
	cnt += 1
	allele += 1
	res += ">Locus{0}|set_{1}|individual{2}|allele_{3}\n".format(locus, species, ind, allele)
	res += "".join(mutations[i]) + "\n"
	if cnt%2 == 0:
		ind += 1
	if allele == 2:
		allele = 0
	
print(res.strip())
	
