# Normal Distribution
X ~ N(μ, σ^2)일 때
pnorm(x, μ, σ) = P( X <= x)
qnorm(α, μ, σ) : alpha=P(X <=x)를 만족하는 x 


pnorm(2, 0, 1)
qnorm(0.05, 0,1)


# Central limit theorem
floor : 버림
runifrom : r unifrom 난수, 균일 분포 생성 

x = floor(runif(2500, 0, 10))
x

hist(x)
mean(x)
sd(x)


y = array(x, c(500,5))
y # 2500개의 정수를 크기가 5인 벡터(5개씩 묶어서) 500로 변환


# 크기가 5인 표본에서 표본평균을 구해 500개의 표본평균 생성
xbar = apply(y, 1, mean)
xbar

hist(xbar)
mean(xbar)
sd(xbar)
