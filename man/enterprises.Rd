% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/enterprises.R
\docType{data}
\name{enterprises}
\alias{enterprises}
\title{Simulated data set with enterprise locations.}
\format{
An object of class \code{SpatialPointsDataFrame} with 8348 rows and 2 columns.

\describe{
\item{production}{\code{numeric} simulated production (lognormal).}
\item{fined}{logical simulated variable if an enterprise is fined or not.}
}
}
\source{
Basisregistratie Adressen en Gebouwen: \url{https://www.kadaster.nl/zakelijk/registraties/basisregistraties/bag/bag-producten}
}
\usage{
enterprises
}
\description{
\code{enterprises} is generated from the dutch open data
\href{https://www.kadaster.nl/zakelijk/registraties/basisregistraties/bag/bag-producten}{BAG register}.
The locations are realistic, but the associated data is simulated.
}
\examples{
\donttest{
library(sdcSpatial)
library(raster)

data("enterprises")

production <- sdc_raster(enterprises, "production", min_count = 10)
print(production)

# show the average production per cell
plot(production, "mean")
production$min_count <- 2 # adjust norm for sdc
plot(production)

production_safe <- remove_sensitive(production)
plot(production_safe)
}
}
\keyword{datasets}
