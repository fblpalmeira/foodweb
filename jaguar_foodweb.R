library (foodweb)
library (rgl)

web<-read.csv("jaguar_foodweb.csv", row.names=1)
write.table(web, file = "jaguar.out.csv", append=F, quote=F,sep=",", col.names=F, row.names=F)
analyse.single(filename="jaguar.out.csv", omn=c("TRUE"), cann=c("TRUE"), positions=c("TRUE"))
mat.2.list(filename="jaguar.out.csv", output="jaguar.mat.csv")
par3d(windowRect = c(20, 30, 800, 800))
plotweb(col=c("red","orange","yellow","blue","purple", "green"), radii=c(5,10,12,12,12,12))
legend3d("topleft", col=c("red", "yellow", "blue", "orange", "purple", "green"), 
         legend = c("jaguar", "puma", "ocelot", "medium mesopredators", "small mesopredators", "herbivores"), 
         pch=16, cex=1.5,  bty = "n")

# Save like gif
movie3d(
  movie="jaguar_foodweb", 
  spin3d( axis = c(0, 0, 1), rpm = 10),
  duration = 20, 
  dir = "D:/Francesca/Documents/R/jaguar_foodweb_github",
  type = "gif", 
  clean = TRUE
)

library(magick)
library(magrittr) 

# Call back the plot
plot <- image_read("jaguar_foodweb.gif")
plot2<-image_annotate(plot, "Jaguar-mesopredator-prey network", 
                      color = "black", size = 25,
                      location = "10+50", gravity = "north")
plot3<-image_annotate(plot2, "Data: Palmeira FBL, 2015 (10.11606/T.11.2015.tde-17092015-111206) | Visualization by @fblpalmeira 
                          Image credit: P. onca (Palomo-Munoz, G) @PhyloPic", 
                      color = "gray", size = 15, 
                      location = "10+50", gravity = "southeast")
# And bring in a logo
logo_raw <- image_read("http://www.phylopic.org/assets/images/submissions/2dc9f865-f0c3-4478-8801-6fafbd983a92.512.png") 
out<-image_composite(plot3,image_scale(logo_raw,"x50"), gravity="north", offset = "+200+110")

image_browse(out)
image_write(out, "jaguar_foodweb2.gif")
