\name{plotSensi}
\alias{plotSensi}
\alias{plotSensi.RDDreg_lm}
\alias{plotSensi.RDDreg_np}
\title{Plot the sensitivity to the bandwidth}
\usage{
  plotSensi(RDDregobject, from, to, by = 0.01,
    level = 0.95, output = c("data", "ggplot"),
    plot = TRUE, ...)

  \method{plotSensi}{RDDreg_np} (RDDregobject, from, to,
    by = 0.05, level = 0.95, output = c("data", "ggplot"),
    plot = TRUE, device = c("ggplot", "base"),
    vcov. = NULL, ...)

  \method{plotSensi}{RDDreg_lm} (RDDregobject, from, to,
    by = 0.05, level = 0.95, output = c("data", "ggplot"),
    plot = TRUE, order, type = c("colour", "facet"), ...)
}
\arguments{
  \item{RDDregobject}{object of a RDD regression, from
  either \code{\link{RDDreg_lm}} or
  \code{\link{RDDreg_np}}}

  \item{from}{First bandwidth point. Default value is
  max(1e-3, bw-0.1)}

  \item{to}{Last bandwidth point. Default value is bw+0.1}

  \item{by}{Increments in the \code{from} \code{to}
  sequence}

  \item{level}{Level of the confidence interval}

  \item{order}{For parametric models (from
  \code{\link{RDDreg_lm}}), the order of the polynomial.}

  \item{type}{For parametric models (from
  \code{\link{RDDreg_lm}}) whether different orders are
  represented as different colour or as different facets.}

  \item{device}{Whether to draw a base or a ggplot graph.}

  \item{output}{Whether to return (invisibly) the data
  frame containing the bandwidths and corresponding
  estimates, or the ggplot object}

  \item{plot}{Whether to actually plot the data.}

  \item{\ldots}{Further arguments passed to specific
  methods}

  \item{vcov.}{Specific covariance function to pass to
  coeftest. See help of package
  \code{\link[sandwich]{sandwich}}}
}
\value{
  A data frame containing the bandwidths and corresponding
  estimates and confidence intervals.
}
\description{
  Draw a plot showing the LATE estimates depending on
  multiple bandwidths
}
\examples{
data(Lee2008)
Lee2008_rdd <- RDDdata(y=Lee2008$y, x=Lee2008$x, cutpoint=0)

#Non-parametric estimate
bw_ik <- RDDbw_IK(Lee2008_rdd)
reg_nonpara <- RDDreg_np(RDDobject=Lee2008_rdd, bw=bw_ik)
plotSensi(reg_nonpara)
plotSensi(reg_nonpara, device="ggplot")

#Parametric estimate:
reg_para_ik <- RDDreg_lm(RDDobject=Lee2008_rdd, order=4, bw=bw_ik)
plotSensi(reg_para_ik)
plotSensi(reg_para_ik, type="facet")
}
\author{
  Matthieu Stigler <\email{Matthieu.Stigler@gmail.com}>
}

