\name{as.npregbw}
\alias{as.npreg}
\alias{as.npregbw}
\title{Convert an RDDreg object to a  \code{npreg} object}
\usage{
  as.npregbw(x, ...)

  as.npreg(x, ...)
}
\arguments{
  \item{x}{Object of class \code{RDDreg} created by
  \code{\link{RDDreg_np}} or \code{\link{RDDreg_lm}}}

  \item{\ldots}{Further arguments passed to the
  \code{\link{npregbw}} or \code{\link{npreg}}}
}
\description{
  Convert an RDDobject to a non-parametric regression
  \code{npreg} from package \code{np}
}
\details{
  This function converts an RDDreg object into an
  \code{npreg} object from package \code{np} Note that the
  output won't be the same, since \code{npreg} does not
  offer a triangualr kernel, but a gaussian or Epanechinkov
  one. Another reason why estimates might differ slightly
  is that \code{npreg} implements a multivariate kernel,
  while RDDreg proceeds as if the kernerl was univariate. A
  simple solution to make the multivariate kernel similar
  to the univariate one is to set the bandwidth for x and
  Dx to a large number, so that they converge towards a
  constant, and one obtains back the univariate kernel.
}
\examples{
# Estimate ususal RDDreg:
 data(Lee2008)
 Lee2008_rdd <- RDDdata(y=Lee2008$y, x=Lee2008$x, cutpoint=0)
 reg_nonpara <- RDDreg_np(RDDobject=Lee2008_rdd)

## Convert to npreg:
 reg_nonpara_np <- as.npreg(reg_nonpara)
 reg_nonpara_np
 RDDcoef(reg_nonpara_np)

## Compare with result obtained with a Gaussian kernel:
 bw_lm <- dnorm(Lee2008_rdd$x, sd=RDDtools:::getBW(reg_nonpara))
 reg_nonpara_gaus <- RDDreg_lm(RDDobject=Lee2008_rdd, w=bw_lm)
 all.equal(RDDcoef(reg_nonpara_gaus),RDDcoef(reg_nonpara_np))
}

