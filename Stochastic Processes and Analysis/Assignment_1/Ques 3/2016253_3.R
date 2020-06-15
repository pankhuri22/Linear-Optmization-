X = rexp(1000,2)
a = c()
sum = 0
count = 0
for(i in 1:1000){
  s = sum + X[i]
  count = count + 1
  if(s > 20){
    break
  }
  a = c(a,s)
  sum = a[i]
}


X4 = rexp(1000,3)
a4 = c()
sum4 = 0
count4 = 0
for(i in 1:1000){
  s4 = sum4 + X4[i]
  count4 = count4 + 1
  if(s4 > 20){
    break
  }
  a4= c(a4,s4)
  sum4 = a4[i]
}



Xc = rexp(1000,5)
ac = c()
sumc = 0
countc = 0
for(i in 1:1000){
  sc = sumc + Xc[i]
  countc = countc + 1
  if(sc > 20){
    break
  }
  ac= c(ac,sc)
  sumc = ac[i]
}

plot(x=a,y=1:length(a),type="l",xlab="months",ylab="arrivals")
points(x=a4,y=1:length(a4),type = "l",col='red')
points(x=ac,y=1:length(ac),type="l",col="yellow")





title(xlab="Months")
title(ylab="Arrivals")


legend(1, 30, legend=c("female", "male","combined"),
       col=c("black", "red","yellow"), lty=1, cex=0.5)

N1 = c()
for(i in 1:20){
  yo1 = a[a<i]
  l1 = length(yo1)
  N1 = c(N1,l1)
}

N2 = c()
for(i in 1:20){
  yo2 = a4[a4<i]
  l2 = length(yo2)
  N2 = c(N2,l2)
}

N3 = c()
for(i in 1:20){
  yo3 = ac[ac<i]
  l3 = length(yo3)
  N3 = c(N3,l3)
}



plot(N1,type="l",xlab= "months",ylab="total arrivals")
points(N2,type="l",col='green')
points(N3,type="l",col='blue')

title(xlab="Months")
title(ylab="Total Arrivals")


legend(1, 30, legend=c("female", "male","combined"),
       col=c("black", "green","blue"), lty=1, cex=0.5)
