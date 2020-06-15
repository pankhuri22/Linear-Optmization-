rm(list=ls())
n <- 90  #total no of cases 
fav_cases <- 50 # no of cases in which names are ending with "ko"
p_hat <- fav_cases/ n 
p_val <- 0.70

# assumptions are met as the values are grester than 5 
np <- n*p_val
nq <- n*(1-p_val)

#test-statistic value
z_val <- (p_hat - p_val)/ sqrt(p_val*(1-p_val)/n) #z-stat value for proportion test

#critical value
alpha = .05 
z.alpha = qnorm(alpha)
z_cv <- z.alpha

#p-value
pnorm(z_val)
