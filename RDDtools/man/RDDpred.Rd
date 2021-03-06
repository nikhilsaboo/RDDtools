\name{RDDpred}
\alias{RDDpred}
\title{RDD coefficient prediction}
\usage{
  RDDpred(object, covdata, se.fit = TRUE, vcov. = NULL,
    newdata, stat = c("identity", "sum", "mean"), weights)
}
\arguments{
  \item{object}{A RDD regression object}

  \item{covdata}{New data.frame specifying the values of
  the covariates, can have multiple rows.}

  \item{se.fit}{A switch indicating if standard errors are
  required.}

  \item{vcov.}{Specific covariance function (see package
  sandwich ), by default uses the \code{\link{vcov}}}

  \item{newdata}{Another data on which to evaluate the x/D
  variables. Useful in very few cases.}

  \item{stat}{The statistic to use if there are multiple
  predictions, 'identity' just returns the single values,
  'mean' averages them}

  \item{weights}{Eventual weights for the averaging of the
  predicted values.}
}
\value{
  Returns the predicted value(s), and, if se.fit=TRUE,
  their standard errors.
}
\description{
  Function to predict the RDD coefficient in presence of
  covariate (without covariates, returns the same than
  \code{\link{RDDcoef}})
}
\details{
  The function \code{RDDpred} does a simple prediction of
  the RDD effect \deqn{RDDeffect= \mu(x, z, D=1) - \mu(x,
  z, D=0)} When there are no covariates (and z is
  irrelevant in the equation above), this amounts exactly
  to the usual RDD coefficient, shown in the outputs, or
  obtained with \code{\link{RDDcoef}}. If there were
  covariates, and if these covariates were estimated using
  the \dQuote{include} \emph{strategy} and with different
  coefficients left and right to the cutoff (i.e. had
  argument \emph{slope} = \dQuote{separate}), than the RDD
  effect is also dependent on the value of the
  covariate(s). \code{RDDpred} allows to set the value of
  the covariate(s) at which to evaluate the RDD effect, by
  providing a data.frame with the values for the
  covariates. Note that the effect can be evaluated at
  multiple points, if you provide multiple rows of
  \code{covdata}.

  In pressence of covariate-specific RDD effect, one may
  wish to estimate an average effect. This can be done by
  setting the argument \code{stat="mean"}. Weights can
  additionally be added, with the argument \code{weights},
  to obtain a weighted-average of the predictions. Note
  however that in most cases, this will be equivalent to
  provide covariates at their (weighted) mean value, which
  will be much faster also!

  Standard errors, obtained setting the argument
  \code{se.fit=TRUE}, are computed using following formula:
  \deqn{x_i \Omega x_i^{'}} where \eqn{\Omega} is the
  estimated variance-covariance matrix ( by default
  \eqn{\sigma^2(X^{'}X)^{-1}} using \code{\link{vcov}}) and
  \eqn{x_i} is the input data (a mix of covdata and input
  data). If one wishes individual predictions, standard
  errors are simply obtained as the square of that diagonal
  matrix, whereas for mean/sum, covariances are taken into
  account.
}
\examples{
## Load data, add (artificial) covariates:
  data(Lee2008)
  n_Lee <- nrow(Lee2008)
  z1 <- runif(n_Lee)
  Lee2008_rdd <- RDDdata(y=y, x=x, data=Lee2008, z=z1, cutpoint=0)

## estimation without covariates: RDDpred is the same than RDDcoef:
  reg_para <- RDDreg_lm(RDDobject=Lee2008_rdd)

  RDDpred(reg_para)
  RDDcoef(reg_para, allInfo=TRUE)

## estimation with covariates:
  reg_para_cov <- RDDreg_lm(RDDobject=Lee2008_rdd, covariates="z1", covar.opt=list(slope="separate"))
  RDDpred(reg_para_cov, covdata=data.frame(z1=0)) ## should obtain same result than with RDestimate
  RDDpred(reg_para_cov, covdata=data.frame(z1=0.5)) #evaluate at mean of z1 (as comes from uniform)
}
\references{
  Froehlich (2007) Regression discontinuity design with
  covariates, IZA discussion paper 3024
}

