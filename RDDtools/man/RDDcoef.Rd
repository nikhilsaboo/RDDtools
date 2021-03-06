\name{RDDcoef}
\alias{RDDcoef}
\alias{RDDcoef.RDDreg_np}
\alias{RDDcoef.default}
\title{RDD coefficient}
\usage{
  RDDcoef(object, allInfo = FALSE, allCo = FALSE, ...)

  \method{RDDcoef}{default} (object, allInfo = FALSE,
    allCo = FALSE, ...)

  \method{RDDcoef}{RDDreg_np} (object, allInfo = FALSE,
    allCo = FALSE, ...)
}
\arguments{
  \item{object}{A RDD regression object}

  \item{allInfo}{whether to return just the coefficients
  (allInfo=FALSE) or also the se/t stat/pval.}

  \item{allCo}{Whether to give only the RDD coefficient
  (allCo=FALSE) or all coefficients}

  \item{\ldots}{Further arguments passed to/from specific
  methods}
}
\value{
  Either a numeric value of the RDD coefficient estimate,
  or a data frame with the estimate, its standard value, t
  test and p-value and
}
\description{
  Function to access the RDD coefficient in the various
  regressions
}

