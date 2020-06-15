#Pankhuri Kasliwal
#2016253

#lower_bound is the absorbing boundaries lower bound
#upper_bound is the absrbing boundaries upper bound
#initial is the initial amount of money that they start with
#p is some random probability
GamblerRuin <- function(initial,p, upper_bound, lower_bound) 
  
  {
  #array initialised for storing states at each iteratiom
  c <- numeric(0)
  while (initial > lower_bound && initial < upper_bound)
{
    #tossing of coin simulated through a random bionomial process with some random probability p=0.5
  coin = rbinom(1, 1, p)
  #if 1 then moves forward one step
  if (coin == 1)
  {
    initial = initial + 1
    c <- array(c(c,initial))
  }
  #else moves backward 1 step
  else
  {
    initial = initial - 1
    c <- array(c(c,initial))
  }
  }
  #finally returns the array containing the states at each iteration
  return(c)
}

#p=0.5
t <- GamblerRuin(10,0.5,20,0)
t
plot(t,type='l',xlab="Index",ylab="Sn")

