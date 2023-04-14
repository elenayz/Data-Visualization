library(rgdal)
library(broom)
library(ggplot2)

download.file("http://thematicmapping.org/downloads/TM_WORLD_BORDERS_SIMPL-0.3.zip", 
              destfile='~/Desktop/30 Day Chart Challenge/Day 3 - Flora and Fauna/world_shape_file.zip')

system('unzip world_shape_file.zip')

my_spdf <- readOGR(dsn = getwd(), 
  layer="TM_WORLD_BORDERS_SIMPL-0.3",
  verbose=FALSE
)

malaysia = my_spdf[my_spdf@data$NAME=='Malaysia',]

plot(malaysia)

df=fortify(malaysia)

ggplot()+
  geom_polygon(data=df,aes(x=long, y=lat))

help(package=mapdata)

map('worldHires',col="black", lwd=1, mar=rep(0,4) )
