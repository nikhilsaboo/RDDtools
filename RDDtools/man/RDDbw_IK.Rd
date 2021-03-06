\name{RDDbw_IK}
\alias{RDDbw_IK}
\title{Imbens-Kalyanaraman Optimal Bandwidth Calculation}
\usage{
  RDDbw_IK(RDDobject,
    kernel = c("Triangular", "Uniform", "Normal"))
}
\arguments{
  \item{RDDobject}{of class RDDdata created by
  \code{\link{RDDdata}}}

  \item{kernel}{The type of kernel used: either
  \code{triangular} or \code{uniform}.}
}
\value{
  The optimal bandwidth
}
\description{
  Imbens-Kalyanaraman optimal bandwidth for local linear
  regression in Regression discontinuity designs.
}
\examples{
data(Lee2008)
rd<- RDDdata(x=Lee2008$x, y=Lee2008$y, cutpoint=0)
RDDbw_IK(rd)
}
\author{
  Matthieu Stigler <\email{Matthieu.Stigler@gmail.com}>
}
\references{
  Imbens, Guido and Karthik Kalyanaraman. (2012) "Optimal
  Bandwidth Choice for the regression discontinuity
  estimator," Review of Economic Studies (2012) 79, 933-959
}

