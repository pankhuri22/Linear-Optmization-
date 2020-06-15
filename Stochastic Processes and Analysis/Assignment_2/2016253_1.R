#Pankhuri Kasliwal
#2016253

library(MASS)
#gaussprocess is the process used for simulating a gaussian random process
gaussprocess <- function(from = 0, to = 1, K = function(s, t) {min(s, t)},
                         start = 0, m = 1000) {
  
  #seq is used to generate a sequence of epochs for 1000 iterations
  t <- seq(from = from, to = to, length.out = m)
  #sigma is the covariance matrix sapply function returns a matrix
  Sigma <- sapply(t, function(s1) {sapply(t, function(s2) {K(s1, s2)})})
  
  #mvnorm function from MASS library is used to simulate a multivariate gaussian 
  #random process but by default it has 1 that is it works for univariate 
  #distribution
  path <- mvrnorm(mu = rep(0, times = m), Sigma = Sigma)

  return(data.frame("xt" = path,"t" = t))
}
# m is for Weiner process (B)
# n is for the gaussian process (A) 
m <- gaussprocess(0, 1, function(s, t) {min(s, t)}, 0, 1000)
n <- gaussprocess(0, 1, function(s, t) {exp(-1*16* ((s-t)**2))}, 0, 1000)
plot(m,type='l')
plot(n,type='l')

