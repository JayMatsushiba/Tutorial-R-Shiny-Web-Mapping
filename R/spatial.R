# This will contain the spatial data analysis code for this workshop.
library(sf)
library(terra)
library(tidyverse)

# These are iNaturalist observations of the American Black Bear in British Columbia
# This is an example of a point data.
black_bear_observations_bc <- st_read("data/black_bear_observations_bc/black_bear_observations_bc.shp")

# This is a polygon representing the boundaries of Burnaby
# https://data.burnaby.ca/datasets/d903b87782734451ae286cb0b59938ac
burnaby <- st_read("data/Burnaby_Boundary/Burnaby_Boundary.shp")

# This is a polygon representing British Columbia
# https://open.canada.ca/data/en/dataset/a883eb14-0c0e-45c4-b8c4-b54c4a819edb
british_columbia <- st_read("data/british_columbia/british_columbia.shp")

