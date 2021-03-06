\name{gen_MC_IK}
\alias{gen_MC_IK}
\title{Generate Monte Carlo simulations of Imbens and Kalyanaraman}
\usage{
  gen_MC_IK(n = 200, version = 1, sd = 0.1295,
    output = c("data.frame", "RDDdata"), size)
}
\arguments{
  \item{n}{The size of sampel to generate}

  \item{version}{The MC version of Imbens and Kalnayaraman
  (between 1 and 4).}

  \item{sd}{The standard deviation of the error term.}

  \item{output}{Whether to return a data-frame, or already
  a RDDdata}

  \item{size}{The size of the effect, this depends on the
  specific version, defaults are as in IK: 0.04, NULL, 0.1,
  0.1}
}
\value{
  An data frame with x and y variables.
}
\description{
  Generate the simulations reported in Imbens and
  Kalyanaraman (2012)
}
\examples{
MC1_dat <- gen_MC_IK()
MC1_rdd <- RDDdata(y=MC1_dat$y, x=MC1_dat$x, cutpoint=0)

## Use np regression:
reg_nonpara <- RDDreg_np(RDDobject=MC1_rdd)
reg_nonpara

# Represent the curves:
plotCu <- function(version=1, xlim=c(-0.1,0.1)){
  res <- gen_MC_IK(sd=0.0000001, n=1000, version=version)
  res <- res[order(res$x),]
  ylim <- range(subset(res, x>=min(xlim) & x<=max(xlim), "y"))
  plot(res, type="l", xlim=xlim, ylim=ylim, main=paste("DGP", version))
  abline(v=0)
  xCut <- res[which(res$x==min(res$x[res$x>=0]))+c(0,-1),]
  points(xCut, col=2)
}
layout(matrix(1:4,2, byrow=TRUE))
plotCu(version=1)
plotCu(version=2)
plotCu(version=3)
plotCu(version=4)
layout(matrix(1))
}
\references{
  TODO
}

