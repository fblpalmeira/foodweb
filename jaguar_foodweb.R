install.packages ("foodweb")
install.packages ("rgl")
library (foodweb)
library (rgl)

web<-read.csv("jaguar_foodweb.csv", row.names=1)
write.table(web, file = "jaguar.out.csv", append=F, quote=F,sep=",", col.names=F, row.names=F)
analyse.single(filename="jaguar.out.csv", omn=c("TRUE"), cann=c("TRUE"), positions=c("TRUE"))
mat.2.list(filename="jaguar.out.csv", output="jaguar.mat.csv")
plotweb(col=c("red","orange","yellow","blue","purple", "green"), radii=c(5,10,12,12,12,12))

movie3d( spin3d(), duration = 15 )
