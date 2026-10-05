#vector 1 

if (!require(pacman)) install.packages("pacman")

pacman::p_load(tidyverse,
               sf,
               mapview)



# SHAPE format 
# how to read vector data 
sf_nc_county <- st_read(dsn = "data/nc.shp" ,
                        quiet = TRUE)

#code to export shape files 
st_write(sf_nc_county ,
         dsn = "data/sf_nc_county.shp" ,
         append = FALSE)

# RDS format 
saveRDS(sf_nc_county,
        file = "data/sf_nc_county.rds")

sf_nc_county <- readRDS(file = "data/sf_nc_county.rds")


# point 

sf_site <- readRDS("data/sf_finsync_nc.rds")

mapview(
  sf_site,
  col.regions = "black" , # points fill color 
  legend = FALSE 
)

# select the false 10 sites 
sf_site_f10 <- sf_site %>% 
  slice(1:10)

mapview(
  sf_site_f10,
  col.regions = "pink" ,
  legend = FALSE
)

#line 

sf_str <- readRDS("data/sf_stream_gi.rds")

mapview(
  sf_str,
  col.regions = "blue",
  legend = FALSE
)

# polygon 
sf_nc_county <- readRDS("data/sf_nc_county.rds")

mapview(
  sf_nc_county ,
  col.regions = "grey",
  legand = FALSE
)

# select "guilford" county, then map 
sf_nc_gi <- sf_nc_county %>% 
  filter(county == "guilford")

mapview(
  sf_nc_gi,
  col.regions = "grey",
  legend = FALSE
)

# static map in ggplot format 

ggplot() +
  geom_sf(data = sf_nc_county)

ggplot() +
  geom_sf(data = sf_nc_county) + 
  geom_sf(data = sf_str) +
  geom_sf(data = sf_site)

# exercise

sf_str_as <- readRDS(file = "data/sf_stream_as.rds")



sf_str_as
sf_nc_county




ggplot() +
  geom_sf(data = sf_nc_county) +
  geom_sf(data = sf_str_as)


sf_nc_as <- sf_nc_county %>% 
  filter(county == "ashe")

ggplot() +
  geom_sf(data = sf_nc_as) + 
  geom_sf(data = sf_str_as)


