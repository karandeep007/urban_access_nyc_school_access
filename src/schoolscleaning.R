library("httr")
library("rgdal")
library("plyr")
library("data.table")
library("broom")
library("rgeos")
library("sp")

schools <- readOGR("G:/Redrock/Stevens/Datasets/Public_School_Locations","Public_Schools_Points_2011-2012A")
schools_df <- as.data.frame(schools)
schools_df <- rename(schools_df,c("coords.x1"="long","coords.x2"="lat"))
proj4string(schools)
proj4string(nyc_neighborhoods)
head(schools_df)
pts<-data.frame(x=schools_df$long,y=schools_df$lat)
head(pts)
pts <- pts*1.000002
head(pts)
coordinates(pts) <- c('x', 'y')
proj4string(pts)=CRS("+init=epsg:2263")
pts <- spTransform(pts,CRS("+init=epsg:4326"))
pts <- as.data.frame(pts)
summary(pts)


schools_df$lat <- NULL
schools_df$long <- NULL
schools_df <- cbind(schools_df,pts)
head(schools_df)
types <- c("Elementary","High school","Junior High-Intermediate-Middle","K-12 all grades","Secondary School")
schools_df <- schools_df[schools_df$SCH_TYPE %in% types,]
aggregate.data.frame(schools_df,list(schools_df$SCH_TYPE),FUN = length)
write.csv(schools_df,"finalloc.csv")                
