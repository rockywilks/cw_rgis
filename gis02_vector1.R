#raster 1:basic terra operation

install.packages("pacman")

pacman::p_load(tidyverse,
               terra,
               tidyterra,
               mapview,
               starts)
#rast is a function to read data fr