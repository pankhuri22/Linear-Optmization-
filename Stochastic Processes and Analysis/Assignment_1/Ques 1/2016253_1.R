distribution <- rbinom(30,1,0.8)
firstT <- pgeom(0:30,0.8)
# plot(pgeom(0:30,0.8),type="s",col="blue")
c <- numeric(0)
c <- append(c,0)
for( i in 0:29){
  c <- append(c,pgeom(i,0.8))
}
print(c)
 plot(c,type="S",col = "red",xlab="time", ylab="probability")

 
 
 