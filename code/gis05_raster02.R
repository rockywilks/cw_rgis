#raster 2
if (!require(pacman)) install.packages("pacman")

pacman::p_load(tidyverse,
               terra,
               tidyterra,
               mapview,
               stars)

# erase existing objects
rm(list = ls())


# precipitionexample 

spr_prec <- rast("data/spr_prec_us.tif")
ext(spr_prec)

ggplot() +
  geom_spatraster(data = spr_prec)

spr_prec_crop <- crop(x = spr_prec,
     y = c(-80, -75, 34, 37))

# a map of crop dat a
ggplot()+ 
  geom_spatraster(data = spr_prec_crop)


sf_nc_county <- readRDS("data/sf_nc_county.rds")

ggplot() + 
  geom_spatraster(data = spr_prec_crop)
  geom_sf(data = sf_nc_county,
          alpha = 0.25)
  
spr_prec_nc <- crop(x = spr_prec,
                    y = sf_nc_county)
  
  
  
  
# map spr_prec_nc with sf_nc_ county
ggplot() +
  geom_spatraster(data = spr_prec_nc) +
  geom_sf(data = sf_nc_county,
          alpha = 0.25)


# merge

spr_nw <- rast("data/spr_prec_ncnw.tif")
spr_ne <- rast("data/spr_prec_ncne.tif")
spr_sw <- rast("data/spr_prec_ncsw.tif")
spr_se <- rast("data/spr_prec_ncse.tif")

#
ggplot() +
  geom_spatraster(data = spr_nw) +
  geom_sf(data = sf_nc_county,
          alpha = 0.25)

#
ggplot() +
  geom_spatraster(data = spr_sw) +
  geom_sf(data = sf_nc_county,
          alpha = 0.25)

# merge function to combine two panels then map 
spr_n <- merge(spr_nw, spr_ne)

ggplot() +
  geom_spatraster_contour(data = spr_n) +
  geom_sf(data = sf_nc_county,
          alpha = 0.25)

#
list_spr <- list(spr_ne,
                 spr_nw,
                 spr_se,
                 spr_sw)

#
spr_col <- sprc(list_spr)

#
spr_merge <- merge(spr_col)

#
ggplot() +
  geom_spatraster(data = spr_merge) +
  geom_sf(data = sf_nc_county,
          alpha = 0.25,
          fill = "tomato")

writeRaster(spr_merge,
            "data/spr_prec_nc.tif",
            overwrite = TRUE)

#


spr_prec_nc <- rast("data/spr_prec_nc.tif")
spr_tmp_nc <- rast("data/spr_tmp_nc.tif")

ggplot() +
  geom_spatraster(data = spr_tmp_nc) +
  geom_sf(data = sf_nc_county,
          alpha = 0.25)

#
spr_pt_nc <- c(spr_prec_nc,
               spr_tmp_nc)
#acces one layer
#-percition 
spr_pt_nc$precipitation

#temp
spr_pt_nc$temperature


#try to stack spr_nc and spr_tmp_nc
#c(spr_ne, spr_tmp_nc)
#this would not work because of sptial extent mismatch


# reprojection 

#reprojection transform crs from one to anthoer 
#most case

spr_prec_nc_proj <- project(x = spr_prec_nc,
        y = "EPSG:32617") #32617 




# 1,
spr_tmp_ncnw <- rast("data/spr_tmp_ncnw.tif")
spr_tmp_ncne <- rast("data/spr_tmp_ncnw.tif")
spr_tmp_ncsw <- rast("data/spr_tmp_ncnw.tif")
spr_tmp_ncse <- rast("data/spr_tmp_ncnw.tif")

list_tmp <- list(
  spr_tmp_ncnw,
  spr_tmp_ncne,
  spr_tmp_ncsw,
  spr_tmp_ncse
)

tmp_sprc <- sprc(list_tmp)

spr_tmp_merge<- merge(tmp_sprc)

ggplot() +
  geom_spatraster(data = spr_tmp_merge) +
  geom_sf(data = sf_nc_county,
          fill = "green",
          alpha = 0.25)

#2 
sf_camden <- sf_nc_county %>% 
  filter(county == "camden")
ext(sf_camden)
spr_tmp_camden <- crop(x = spr_merge,
                       y = sf_camden)

# 3 
spr_tmp_camden_proj <- project(x = spr_tmp_camden,
        y = "EPSG:32617",
        method = "bilinear")



