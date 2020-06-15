rm(list=ls())

data1 <- c(8,7,9,5,9,8,10,7,6,9)
data2 <- c(6,5,5,4,7,7,7,5,6,5)
n1 <- length(data1); 
n2 <- length(data2);

mu1 <- mean(data1); 
mu2 <- mean(data2);
sigma_1 <- var(data1); 
sigma_2 <- var(data2);

#difference between observations 
diff <- data1 - data2

#mean value of the difference for the population of all pairs
mu_d <- mean(diff);

#standard deviation of difference for the paired sample data
sigma_d <- sqrt(var(diff));
d <- 2

# we find the t-stat, as the samples are dependent, we test the mean of differences for dependent samples 
t_val <- (mu_d - d) / (sigma_d / sqrt(n1))

# we have 9 degrees of freedom, hence we find the critical value of the t-test using alpha = 0.05
t_cv <- (qt(0.05,df=(n1-1),lower.tail = FALSE))

#t_pval<-(pt(abs(t_val),df=(n1-1),lower.tail = FALSE))

