% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/remove_sensitive.R
\name{remove_sensitive}
\alias{remove_sensitive}
\alias{mask_sensitive}
\title{Remove sensitive cells from raster}
\usage{
remove_sensitive(x, max_risk = x$max_risk, min_count = x$min_count, ...)

mask_sensitive(x, max_risk = x$max_risk, min_count = x$min_count, ...)
}
\arguments{
\item{x}{\code{\link{sdc_raster}} object.}

\item{max_risk}{a risk value higher than \code{max_risk} will be sensitive.}

\item{min_count}{a count lower than \code{min_count} will be sensitive.}

\item{...}{passed on to \code{\link{is_sensitive}}.}
}
\value{
sdc_raster object with sensitive cells set to \code{NA}.
}
\description{
\code{remove_sensitive} removes sensitive cells from a \code{\link{sdc_raster}}.
The sensitive cells, as found by \code{\link[=is_sensitive]{is_sensitive()}} are set to NA.
}
\details{
Removing sensitive cells is a protection method, which often is useful to
finalize map protection after other protection methods have been applied.
\code{mask_sensitive} and \code{remove_sensitive} are synonyms, to accommodate both
experienced \code{raster} users as well as sdc users.
}
\examples{
\donttest{
library(raster)

unemployed <- sdc_raster(dwellings[1:2], dwellings$unemployed, r=200)

# plot the normally rastered data
plot(unemployed, zlim=c(0,1))
plot_sensitive(unemployed)

unemployed_safe <- remove_sensitive(unemployed, risk_type="discrete")
plot_sensitive(unemployed_safe, zlim=c(0,1))
print(unemployed)
unemployed$value
}
}
\seealso{
Other sensitive: 
\code{\link{disclosure_risk}()},
\code{\link{is_sensitive_at}()},
\code{\link{is_sensitive}()},
\code{\link{plot_sensitive}()},
\code{\link{sdc_raster}()},
\code{\link{sensitivity_score}()}

Other protection methods: 
\code{\link{protect_quadtree}()},
\code{\link{protect_smooth}()}
}
\concept{protection methods}
\concept{sensitive}
