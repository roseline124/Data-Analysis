x <- c(1:10)
y <- x^2-x+10
plot(x,y)
plot(x,y, type="b")
plot(x,y, type="p") #default
plot(x,y, type="S")
plot(x,y, type="s")
plot(x,y, type="h")

plot(x,y, type="p", col="blue", pch=1)

par(mfrow=c(2,4)) #2행 4열의 배열로 plot을 볼 수 있다.  

for(i in 1:8){ #9:16
    plot(x,y, type="p", col="blue", pch=i)
}

#type 
types = c("p","l","o","b","c","s","S","h")

for(i in 1:8){ #9:16
    plot(x,y, type=types[i], col="blue", pch=i)
}


