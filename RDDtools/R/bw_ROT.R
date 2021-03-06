#' Bandwidth selector
#' 
#' implements dpill
#' 
#' @param object object of class RDDdata
#' @references McCrary, Justin. (2008) "Manipulation of the running variable in the regression discontinuity design: A density test," \emph{Journal of Econometrics}. 142(2): 698-714. \url{http://dx.doi.org/10.1016/j.jeconom.2007.05.005}
#' @include plotBin.R
#' @export
#' @author Drew Dimmery <\email{drewd@@nyu.edu}>
#' @examples
#' #No discontinuity

### Crary bw

ROT_bw <- function(object){

  if(!inherits(object, "RDDdata")) stop("Only works for RDDdata objects")
  cutpoint <- getCutpoint(object)
  x <- object$x
  y <- object$y

##### first step
  n <- length(y)
  sd_x <- sd(x, na.rm=TRUE)
  bw_pilot <- (2*sd_x)/sqrt(n)

## hist
  his <- plotBin(x=x, y=y, h=bw_pilot, cutpoint=cutpoint,plot=FALSE, type="number")
#   his2 <- hist(x, breaks=c(min(x), his[["x"]], max(x)))
  x1 <- his$x
  y1 <- his[,"y.Freq"]

##### second step

## regs:
 reg_left  <- lm(y1 ~ poly(x1, degree=4, raw=TRUE), subset=x1<cutpoint)
 reg_right <- lm(y1 ~ poly(x1, degree=4, raw=TRUE), subset=x1>=cutpoint)



}


#' Global bandwidth selector of Ruppert, Sheather and Wand (1995) from package \pkg{KernSmooth}
#' 
#' Uses the global bandwidth selector of Ruppert, Sheather and Wand (1995) 
#' either to the whole function, or to the functions below and above the cutpoint. 
#' 
#' @param object object of class RDDdata created by \code{\link{RDDdata}}
#' @param type Whether to choose a global bandwidth for the whole function (\code{global}) 
#' or for each side (\code{sided})
#' @return One (or two for \code{sided}) bandwidth value. 
#' @references See \code{\link[KernSmooth]{dpill}}
#' @include plotBin.R
#' @import KernSmooth
#' @export
#' @examples
#' data(Lee2008)
#' rd<- RDDdata(x=Lee2008$x, y=Lee2008$y, cutpoint=0)
#' RDDbw_RSW(rd)


####
RDDbw_RSW <- function(object, type=c("global", "sided")){

  type <- match.arg(type)

  if(!inherits(object, "RDDdata")) stop("Only works for RDDdata objects")
  cutpoint <- getCutpoint(object)
  x <- object$x
  y <- object$y

##
  if(type=="global"){
    bw <- dpill(x=x, y=y)
  } else {
    dat_left  <- subset(object, x<cutpoint)
    dat_right <- subset(object, x>=cutpoint)

    bw_left  <- dpill(x=dat_left$x, y=dat_left$y)
    bw_right <- dpill(x=dat_right$x, y=dat_right$y)
    bw <- c(bw_left, bw_right)
  }

## result
  bw
}


if(FALSE){
#   lee_dat4 <- read.csv("/home/mat/Dropbox/HEI/rdd/Rcode/IK bandwidth/datasets/imbens_from_MATLAB.csv", header=FALSE)
#   head(lee_dat4)
#   a<-RDDdata(y=lee_dat4[,2], x=lee_dat4[,1], cutpoint=0)
# ROT_bw(object=a)
# RDDbw_RSW(object=a)
RDDbw_RSW(object=a, type="sided")
}
