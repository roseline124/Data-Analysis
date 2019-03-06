# 정규분포를 구할 때 먼저 x의 범위를 정한다.
x <- seq(40, 120, length=300)
y <- dnorm(x, mean=80, sd=10)
y

plot(x,y, type="l", col="red")
lines(x, dnorm(x, mean=80,sd=20), col="blue")

#probability between 65~75
x2 <- seq(65, 75, length=200)
y2 <- dnorm(x2, mean=80, sd=10)
polygon(c(65, x2, 75), c(0, y2, 0), col="gray") #너비

# dnorm : 분포를 그리고 싶을 때(점의 위치 표현)
# pnorm : 너비  
# qnorm : x 값
# rnorm : 난수 발생시킴 

#polygon을 pnorm으로 편하게 해보자
pnorm(75, mean=80, sd=10)-pnorm(65, mean=80, sd=10)

#p over 92 
pnorm(92, mean=80, sd=10, lower.tail=TRUE)
1 - pnorm(92, mean=80, sd=10)

# p less than 68
pnorm(68, mean=80, sd=10)

#30% 아래를 잘라라
qnorm(0.3, mean=80, sd=10)

#80번째 
qnorm(0.8, mean=80, sd=10)

80 - qnorm(0.8, mean=80, sd=10)
80 - qnorm(0.2, mean=80, sd=10)
