rm(list = ls())

#set.seed(1123)
data = rnorm(1000)
data1<<-data

# unknown parameter estimation using method of moments 
mean.mme <- sum(data1)/length(data1)
var.mme <- sum((data1-mean.mme)^2)/length(data1)

# maximum likelihood estimate of the unknown parameters
n <- length(data1)
logl <- function(init) {
  mean1<-init[1]; var1<-init[2]
  l <- ((-n/2)*log(2*pi*var1) - (1/(2*var1))*sum((data1-mean1)^2))
  return (-l)
}
init<-c(0.05, 0.8)
xmax <- nlminb(start =init , logl, hessian = T)

# plotting log likelihood for different values of mean keeping the variance constant
loglikvalue_mu.norm<-function(mu.norm,x) 
{
  xx <- length(mu.norm)
  loglikelihood.norm <- rep(0,xx)
  for (i in 1:xx){ 
    ll <- logl(init = c(mu.norm[i],1))
    loglikelihood.norm[i] <-  -ll}
  return(loglikelihood.norm)
}
mean.values<-seq(-1,1,by=0.05) 
ll.norm<-loglikvalue_mu.norm(mean.values,data1)
data.norm<-data.frame(cbind(mean.values,ll.norm))
plot(data.norm[,1],data.norm[,2],xlab="mean",ylab="Log-Likelihood",
     xlim=c(-1,1),ylim=c(min(ll.norm),max(ll.norm)))


# plotting log likelihood for different values of mean and variance
loglikvalue_mu.norm<-function(mu.norm,var.norm,x) 
{
  xx <- length(mu.norm)
  yy <- length(var.norm)
  M <- matrix(nrow = xx, ncol =  yy)
  for (i in 1:xx){ 
    for(j in 1:yy){
      ll <- logl(init = c(mu.norm[i],var.norm[j]))
      M[i,j] <- ll
    }
  }
  return(-M)
}
mean.values <-seq(-1, 1, by = 0.01) 
varian.values <- seq(0.1, 2, by = 0.1)

ll.norm<-loglikvalue_mu.norm(mean.values,varian.values,data1)

persp(mean.values, varian.values, ll.norm, col='lightblue', theta = 15, ticktype = 'detailed', xlab='Mean', ylab='Variance', zlab='Negative log-likelihood', main = "Negative Log Likelihood vs c vs sigma")
