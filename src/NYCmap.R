library("rgdal")
library("plyr")
library("raster")
library("ggplot2")
library("ggmap")
library("data.table")
# map(database="county",region="new york")

#borough boundaries

nyc_shape <- readOGR("G:/Redrock/Stevens/Code/data/NYCcensus","cb_2016_36_tract_500k")
nyc_shape_df <- fortify(nyc_shape)


head(nyc_shape_df)

power <- readOGR("G:/Redrock/Stevens/Code/data/Electric Network","Elec_PowerPlants")
power_df <- as.data.frame(power)
power_df <- rename(power_df,c("coords.x1"="long","coords.x2"="lat"))

county <- c("Queens","Kings","Bronx","New York","Richmond")
power_df <- power_df[power_df$COUNTY %in% county,]

# class(power)
# crs(power)
# extent(power)


map <- ggplot() +

  geom_path(data = nyc_shape_df,aes(x = long, y = lat), color = "black", size = 1)

print(map)


