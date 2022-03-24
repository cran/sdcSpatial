## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  out.width = "100%"
)

# preloading
library(sdcSpatial)

## -----------------------------------------------------------------------------
library(sdcSpatial)

## -----------------------------------------------------------------------------
data("enterprises")
head(enterprises)

## -----------------------------------------------------------------------------
summary(enterprises)

## -----------------------------------------------------------------------------
sp::plot(enterprises)

## -----------------------------------------------------------------------------
production <- sdc_raster(enterprises, "production", r = 500)
plot(production, value="mean", sensitive=FALSE, main="mean production")

## -----------------------------------------------------------------------------
raster::plot(production$value[[1:3]])

## -----------------------------------------------------------------------------
print(production)

## -----------------------------------------------------------------------------
production$min_count <- 5
production$max_risk <- 0.9
# or equally 
production <- sdc_raster(enterprises, "production"
                        , r = 500, min_count = 5, max_risk = 0.9)
sensitivity_score(production)

## -----------------------------------------------------------------------------
plot(production)
sensitive_cells <- is_sensitive(production)

## -----------------------------------------------------------------------------
production_smoothed <- protect_smooth(production, bw = 500)
plot(production_smoothed)

## -----------------------------------------------------------------------------
production_safe <- remove_sensitive(production_smoothed)
sensitivity_score(production_safe) # check, double check

## -----------------------------------------------------------------------------
mean_production <- mean(production_safe)
mean_production <- raster::disaggregate(mean_production, 10, "bilinear")
# generated with R >= 3.6
# col <- hcl.colors(10, "YlOrRd", rev = TRUE)
col <- c("#FFFFC8", "#FEF1B2", "#FADC8A", "#F7C252", "#F5A400", "#F18000", 
         "#EB5500", "#D12D00", "#A90D00", "#7D0025")
raster::plot(mean_production, col=col)

# library(leaflet)
# leaflet() %>% 
#   leaflet::addTiles() %>% 
#   leaflet::addRasterImage(mean_production, colors = col, opacity = 0.5)

## -----------------------------------------------------------------------------
fined <- sdc_raster(enterprises, "fined", min_count = 5, r = 200, max_risk = 0.8)
print(fined)

## -----------------------------------------------------------------------------
# col <- hcl.colors(10, rev=TRUE) # generated with R >= 3.6
col <- c("#FDE333", "#BBDD38", "#6CD05E", "#00BE7D", "#00A890"
        , "#008E98",  "#007094", "#185086", "#422C70", "#4B0055")
plot(fined, "mean", col=col)

## -----------------------------------------------------------------------------
fined_qt <- protect_quadtree(fined)
plot(fined_qt, col=col)

## -----------------------------------------------------------------------------
fined_smooth <- protect_smooth(fined, bw = 500, keep_resolution=FALSE)
plot(fined_smooth, col = col)
sensitivity_score(fined_smooth)

