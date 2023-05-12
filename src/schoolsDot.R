library("rgdal")
library("plyr")
library("raster")
library("ggplot2")
library("ggmap")
library("data.table")
library("httr")
library("broom")


r <- GET('http://data.beta.nyc//dataset/0ff93d2d-90ba-457c-9f7e-39e47bf2ac5f/resource/35dd04fb-81b3-479b-a074-a27a37888ce7/download/d085e2f8d0b54d4590b1e7d1f35594c1pediacitiesnycneighborhoods.geojson')
nyc_neighborhoods <- readOGR(content(r,'text'), 'OGRGeoJSON', verbose = F)
summary(nyc_neighborhoods)
nyc_neighborhoods_df <- tidy(nyc_neighborhoods)


school_df <- read.csv("G:/Redrock/Stevens/Datasets/Publicschool_cleaned.csv",header=TRUE)
summary(school_df)
aggregate.data.frame(schools_df,list(schools_df$SCH_TYPE),FUN = length)

ggplot() +
  geom_polygon(data=nyc_neighborhoods_df, aes(x=long, y=lat, group=group))+
  geom_point(data = school_df,aes(x = x, y = y), color = "red", size = 1)
