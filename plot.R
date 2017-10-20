x = read.table("info.txt", h=T)


rho = c(0, 10, 20, 30, 40, 50)

res = NULL
for(i in rho){
	sub_rho = x[which(x$populational_rho == i), ]
	tmp = NULL
	for(j in sub_rho[,1]){
		set = read.table(as.character(j), h=T)
		tmp = c(tmp, mean(mean(set$NbRec, na.rm=T)))
	}
	res = cbind(res, tmp)
}

# plot
par(las=1)
S = seq(5, 100, 5)
coul=rainbow(ncol(res))

i=1
plot(S, res[,1], ylim=c(0, 6), xlim=c(0,100), xlab = "nSegSites", ylab = "Rfgt", pch=16, col=coul[1], cex=1.1)
modl = loess(res[,i]~S, span=2)
lines(S, predict(modl), col=coul[i])

for(i in 2:ncol(res)){
	points(S, res[,i], pch=16, col=coul[i], cex=1.1)
	modl = loess(res[,i]~S, span=2.5)
	lines(S, predict(modl), col=coul[i])
}

legend("topleft", legend=rev(paste("rho = ", rho, sep="")), bty="n", col=rev(coul), lty=1)

#dev.print(pdf, "rho_density_Rfgt.pdf", bg="white")
#dev.off()

