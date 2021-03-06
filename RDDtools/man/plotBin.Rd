\name{plotBin}
\alias{plotBin}
\title{Bin plotting}
\usage{
  plotBin(x, y, h = 0.05, nbins = NULL, cutpoint = 0,
    plot = TRUE, type = c("value", "number"),
    xlim = range(x, na.rm = TRUE), cex = 0.9, main = NULL,
    xlab, ylab, ...)
}
\arguments{
  \item{x}{Forcing variable}

  \item{y}{Output}

  \item{h}{the bandwidth (defaults to
  \code{2*sd(runvar)*length(runvar)^(-.5)})}

  \item{cutpoint}{Cutpoint}

  \item{plot}{Logical. Whether to plot or only returned
  silently}

  \item{type}{Whether returns the y averages, or the x
  frequencies}

  \item{xlim,cex,main,xlab,ylab}{Usual parameters passed to
  plot(), see \code{\link{par}}}

  \item{\ldots}{further arguments passed to plot.}
}
\value{
  Returns silently values
}
\description{
  Do a "scatterplot bin smoothing"
}
\author{
  Matthieu Stigler <\email{Matthieu.Stigler@gmail.com}>
}
\references{
  McCrary, Justin.
}
\keyword{internal}

