X = rexp(1000,5)
a = c()
sum = 0
count = 0
for(i in 1:1000){
  s = sum + X[i]
  count = count + 1
  if(s > 50){
    break
  }
  a = c(a,s)
  sum = a[i]
}

X2 = rexp(1000,3)
a2 = c()
sum2 = 0
count2 = 0
for(i in 1:1000){
  s2 = sum2 + X2[i]
  count2 = count2 + 1
  if(s2 > 50){
    break
  }
  a2 = c(a2,s2)
  sum2 = a2[i]
}

X3 = rexp(1000,1)
a3 = c()
sum3 = 0
count3 = 0
for(i in 1:1000){
  s3 = sum3 + X3[i]
  count3 = count3 + 1
  if(s3 > 50){
    break
  }
  a3 = c(a3,s3)
  sum3 = a3[i]
}




plot(x=a2,y=1:length(a2),type="l",cex=.2,ann=FALSE)
points(x=a,y=1:length(a),type="l",col="red",cex=.2)
points(x=a3,y=1:length(a3),type="l",col="blue",cex=.2)

title(xlab="Days")
title(ylab="Number of Arrivals")
legend(1, 150, legend=c("Colorado", "Florida","Texas"),
       col=c("red", "black","blue"), lty=1, cex=0.8)



N1 = c()
for(i in 1:50){
  yo1 = a[a<i]
  l1 = length(yo1)
  N1 = c(N1,l1)
}

N2 = c()
for(i in 1:50){
  yo2 = a2[a2<i]
  l2 = length(yo2)
  N2 = c(N2,l2)
}

N3 = c()
for(i in 1:50){
  yo3 = a3[a3<i]
  l3 = length(yo3)
  N3 = c(N3,l3)
}

plot(N1,type="l",xlab= "days",ylab="no of accidents",cex=.2,ann=FALSE)
points(N2,type="l",col='green',cex=0.2)
points(N3,type="l",col='magenta',cex=0.2)


title(xlab="Days")
title(ylab="Number of accidents")


legend(1, 230, legend=c("Colorado", "Florida","Texas"),
       col=c("black", "green","magenta"), lty=1, cex=1)