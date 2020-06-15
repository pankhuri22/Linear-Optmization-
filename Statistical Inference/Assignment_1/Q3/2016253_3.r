rm(list = ls())
# Modelling geometric Distribution 
n <- 1000
y.geom <- rgeom(n, 0.6)

# Log-likelihood
loglikvalue.geom <- function(prob.geom,x)
{
 loglikelihood.geom<-((n*log(prob.geom))+(log(1-prob.geom)*sum(x)))
  print(loglikelihood.geom)
 #return(loglikelihood.geom)
}

# Different values of p
prob.values <- seq(0.1,0.9,by = 0.001)
p.geom <- loglikvalue.geom(prob.values,y.geom)
data.geom<-data.frame(cbind(prob.values,p.geom))

plot(data.geom[,1],data.geom[,2],xlab="prob",ylab="Log-Likelihood",
     xlim=c(0.1,1),ylim=c(min(p.geom),max(p.geom)))


# Maximum likelihood estimation 
x<<-y.geom

mle.geom<-function(prob.values)
{
  loglikelihood.geom<-((n*log(prob.values))+(log(1-prob.values)*sum(x)))
  return(-loglikelihood.geom)
}

mlevalue.pois<-nlminb(start=0.3,objective=mle.geom,hessian=T)  ### mle of poisson


####
#[1] 0.5988022

#$objective
#[1] 1124.735

#$convergence
#[1] 0

#$iterations
#[1] 6

#$evaluations
#function gradient 
#8        8 

#$message
#[1] "relative convergence (4)"
