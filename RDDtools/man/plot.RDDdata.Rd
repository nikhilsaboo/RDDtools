\name{plot.RDDdata}
\alias{plot.RDDdata}
\title{Plot RDDdata}
\usage{
  \method{plot}{RDDdata} (x, h, nbins = NULL,
    xlim = range(object$x, na.rm = TRUE), cex = 0.7,
    nplot = 1, device = c("base", "ggplot"), ...)
}
\arguments{
  \item{x}{Object of class RDDdata}

  \item{h}{The binwidth parameter (note this differs from
  the bandwidth parameter!)}

  \item{nbins}{Alternative to h, the total number of bins
  in the plot.}

  \item{xlim}{The range of the x data}

  \item{cex}{Size of the points, see \code{\link{par}}}

  \item{nplot}{Number of plot to draw}

  \item{device}{Type of device used. Currently not used.}

  \item{\ldots}{Further arguments passed to the
  \code{\link{plot}} function.}
}
\value{
  A plot
}
\description{
  Binned plot of the forcing and outcome variable
}
\details{
  Produces a simple binned plot averaging values within
  each interval. The length of the intervals is specified
  with the argument \code{h}, specifying the whole binwidth
  (contrary to the usual bandwidth argument, that gives
  half of the length of the kernel window. When no
  bandwidth is given, the bandwidth of Ruppert et al is
  used, see \code{\link{RDDbw_RSW}}.
}
\examples{
data(Lee2008)
Lee2008_rdd <- RDDdata(y=Lee2008$y, x=Lee2008$x, cutpoint=0)
plot(Lee2008_rdd)

## Specify manually the bandwidth:
plot(Lee2008_rdd, h=0.2)

## Show three plots with different bandwidth:
plot(Lee2008_rdd, h=c(0.2,0.3,0.4), nplot=3)

## Specify instead of the bandwidth, the final number of bins:
plot(Lee2008_rdd, nbins=22)

## If the specified number of bins is odd, the larger number is given to side with largest range
plot(Lee2008_rdd, nbins=21)
}
\author{
  Matthieu Stigler <\email{Matthieu.Stigler@gmail.com}>
}

