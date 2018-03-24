


library(sf)
library(sp)

smpl_points <- read_sf("manhattan_sample_points.geojson")

st_make_hexagons <- function(x, n = 100){
  set.seed(1)
  hexs <- sf::st_as_sf(sp::HexPoints2SpatialPolygons(sp::spsample(sf::as_Spatial(sf::st_geometry(x)), "hexagonal", n = n)))
  hexs
}


hexs <- st_make_hexagons(smpl_points, n = 200)
plot(smpl_points)
plot(hexs$geometry, add = T)
