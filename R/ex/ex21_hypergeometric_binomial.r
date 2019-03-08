#binomial : 앞면, 뒷면이 나올 확률

one <- dbinom(1, 10, 0.5) #10번 던져서 1번 성공, 0.5확률
two <- dbinom(2, 10, 0.5)
three <- dbinom(3, 10, 0.5)
four <- dbinom(4, 10, 0.5)
five <- dbinom(5, 10, 0.5)
six <- dbinom(6, 10, 0.5)

#hypergeometric : 빨간 공이 4개이고, 흰 공이 1개일 때 빨간공을 뽑을 확률
dhyper(3, 4, 6, 10) #10명 중 4명이 남자고, 10명 중 3명을 뽑아서 4명 다 뽑을 확률
dhyper(4, 4, 6, 10) #10명 중 4명이 남자고, 10명 중 3명을 뽑아서 4명 다 뽑을 확률

# ?dhyper
a=100
approx <- numeric(length=a)
for (i in 1:a) {
    approx[i] = dhyper(3, 4*i, 6*i, 10)
}

approx

plot(approx[2:100])
abline(h=dbinom(3,10,0.4), col="red")