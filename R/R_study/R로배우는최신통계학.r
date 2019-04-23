# =========================
# 기술 통계 연습문제 p.39
# =========================

# 1. 
v1 <- c(14,7,3,9,13)
v2 <- c(12, 14, 18, 15, 12)
v3 <- c(1,0,11,2,12,8)
v4 <- c(-2,1,-3,0,3,2,-1)

mean(v4)
median(v4)
var(v4)
sd(v4)  

# 2. 

ex.air <- c(9, 12, 18, 14, 12, 14, 12, 10, 16, 
            11, 9, 11, 13, 11, 13, 15, 13, 14)

mean(ex.air)
sd(ex.air)
median(ex.air)

quantile(ex.air)

iqr <- IQR(ex.air)
iqr/2

# 6. scatter

height <- c(167, 165, 162, 167, 160, 163, 168, 
            175, 157, 170, 172, 164, 171, 174)

weight <- c(66, 65, 64, 68, 61, 59, 67, 
            70, 60, 65, 67, 64, 62, 63)

df <- data.frame(height, weight)

# 산점도 
scatter.smooth(df)
plot(weight, height, main = "Scatter Plot")
cor(weight, height)


# 표본 상관계수 

x <- c(2.8, 2.5, 3.2, 1.8, 1.6, 3.6, 2.7, 3.0, 1.5, 3.3, 
       3.1, 2.9, 3.8, 3.2, 2.6, 3.5, 3.3, 2.7, 2.0, 1.8)

y <- c(52, 53, 62, 43, 50, 69, 55, 59, 33, 64, 
       62, 58, 75, 63, 53, 69, 66, 53, 45, 40)

cor(x, y)

# 표본 변동계수

sample <- c(14, 21, 29, 33, 40, 45, 49, 50, 52, 67)

sd(sample)/mean(sample)


# =========================
# 표본 평균 연습문제 p.123
# =========================

# 1.
X = 1/6 
X_1 = 1/6, X_2 = 1/6 

X_1의 평균 : 1/6
X_2 : 1/6 

prop.dice <- c(1/6, 1/6)
df <- data.frame(prop.dice)
dotplot(df)




# 2. 

x <- rnorm(16, 20, 8)
x.mean <- mean(x)
x.sd <- sd(x)

# (1) 0.4012937
pnorm(18, mean = x.mean , sd=x.sd)

# (2) 0.3538302
1 - pnorm(23, mean = x.mean , sd=x.sd)

# (3) 0.1484446
p_21 <- 1 - pnorm(21, mean = x.mean , sd=x.sd)
p_18 <- 1 - pnorm(18, mean = 20, sd=8)

p_18 - p_21

# 3. 
N(168, 5^2)
n = 25 
평균 신장의 표준편차? 5/5 = 1 
n=100일 때 5/10 = 0.5 


# 4. 0.8185
x.mean <- 40
x.sd <- 18/6 
x.sd 

p_34 <- pnorm(34, x.mean, x.sd)
p_34
p_43 <- 1 - pnorm(43, x.mean, x.sd)
p_43
1- (p_34 + p_43)

# 5.

# (1) 841개
x <- pnorm(940, 900, 40)
x 

# (2) 0.1056498 
40/10 = 4
y <- 1- pnorm(905, 900, 4)
y

# 6.

# (1) 
# (2) 
# (3)  
# (4)  

qchisq(0.005, 4) # a = 0.995
qchisq(0.025, 4) # a = 0.975

qchisq(0.95, 4) # 상위 5% 
qchisq(0.90, 9) # 상위 10%
qchisq(0.025, 16) # 하위 2.5%
qchisq(0.01, 8) # 하위 1%

# 7. 

# (1) 0.004535297
dchisq(7.4338, 20) # 0.005

# (2) 0.01210365
dchisq(31.4104, 20) # 0.05

# (3) 0.75
p_95 <- dchisq(9.5908, 20) # 0.025
p_95
p_28 <- dchisq(28.4120, 20) # 0.9 
p_28
p_28 - p_95


# 8. 
t.test()


# ==========================
# 모수 추정 p.147 
# ==========================

# #######모분산을 아는 경우 - Z분포 ##########
# 구조 확인 -> 표본 평균 -> 표본크기, 표준편차 -> 표준 오차 ->
# 신뢰수준 설정 -> 신뢰하한(low bound), 신뢰상한(upper bound) -> 신뢰 구간 

df <- read.csv("dataset/guest_house.csv", header=T)

barplot(df$evlauation)

# 자료 구조 확인
str(df)

# 표본 평균 : 3.2
df.mean <- mean(df$evlauation)

# 표본 크기 : 20 
n <- nrow(df)
n

# 표준편차 : 1.105013
sigma <- sd(df$evlauation)
sigma

# 표본평균의 표준오차 : 0.2470883
se <- sigma/sqrt(n)
se

# 신뢰수준 설정 
alpha <- 0.05

# error : 0.4842842 # lower.tail= False은 ~이하를 구하고 싶을 때. 
error <- qnorm(alpha/2, lower.tail = F)*se
error


# 신뢰 하한 : 2.716
lower <- round(df.mean - error, digits = 3)
lower

# 신뢰 상한 : 3.684
upper <- round(df.mean + error, digits = 3)
upper

# 신뢰 구간 
c(lower, upper)



# #######모분산을 모르는 경우 - t분포 ##########
# t 분포 : https://rfriend.tistory.com/110

df <- read.csv("dataset/guest_house.csv", header=T)

df.mean <- mean(df$evlauation)
df.mean

n <- nrow(df)
n

alpha <- 0.05

df.sd <- sd(df$evlauation)
df.sd

se <- df.sd/sqrt(n)
se

# error : 0.5171618
error <- qt(alpha/2, df=n-1, lower.tail = FALSE)*se
error

lower <- round(df.mean - error, digits=3)
lower

upper <- round(df.mean + error, digits = 3)
upper

c(lower, upper)


# ==========================
# 모비율 추정 p.149 
# ==========================

n <- 3000
x <- 1578 # 남아 출생아 수 
p <- x/n
p # 남아 출생률에 대한 표본 비율 

q <- 1-p # 여어 출생비율 
q

# 표준오차 추정량 
sigma <- sqrt(p*(1-p)/n)
sigma

alpha <- 0.05

error <- qnorm(alpha/2, lower.tail=F)*sigma

lower <- round(p-error, digits=3)
upper <- round(p+error, digits=3)

c(lower, upper)

prop.test(x, n, p=0.5, correct = F)

# ==========================
# 모분산 추정 p.149 
# ==========================

x <- c(226, 228, 226, 225, 232, 228, 227, 229, 225, 230)
n <- length(x)
n

ss <- var(x) #표본 분산
ss

alpha <- 0.05 #유의 수준 

lower <- ss*(n-1)/qchisq(alpha/2, lower.tail=F, df=n-1) #신뢰하한
upper <- ss*(n-1)/qchisq(alpha/2, lower.tail=T, df=n-1) #신뢰하한
round( c(lower, upper), digits=3) # 분산에 대한 95% 신뢰 구간 

round(c( sqrt(lower), sqrt(upper)), digits=3) # 표준편차에 대한 95% 신뢰 구간 


# ==========================
# 모평균 검정  p.174 
# ==========================

######## 모분산을 아는 경우 - Z분포 ##########

x = scan()

n <- length(x)
n

xbar = mean(x)
xbar
sigma <- sqrt(3.1)
sigma

se = sigma/sqrt(n)
se

zalpha <- qnorm(0.99)

mu0 <- 87

Z0 <- (xbar - mu0)/se
Z0
Cl = xbar - zalpha*se
Cl

pval <- pnorm(Z0)
pval

round( c(N=n, Mean=xbar, StDev=sd(x), SEMean=se, Z0=Z0, Cl=Cl, p_value=pval),3)

# 검정통계량의 값이 12.7이며, 
# 유의확률 값을 0으로 유의 수준 1%에서 귀무가설 기각
# 모평균의 값이 80보다 크다고 말할 수 있다. 

# z.test()사용하기 
library(BSDA)

z.test(x, sigma.x = sigma, mu=87, alt="less", conf.level = 0.99)


######## 모분산을 모르는 경우 - t분포 ##########

se <- sd(x)/sqrt(n)
se

talpha <- qt(0.99, n-1)
talpha

mu0 <- 87

T0 <- (xbar-mu0) / se
T0

Cl <- xbar - talpha*se
Cl

round( c(N=n, Mean=xbar, StDev=sd(x), SEMean=se,
         T=T0, Cl=Cl, p_value=pval), 3)

# 해석 : 검정통계량의 값이 7.14이며, 유의확률값은 0으로 유의수준 1%에서
# 귀무가설을 기각한다. 즉, 모평균의 값이 80보다 크다고 말할 수 있다. 

# t.test() 함수 사용 

t.test(x, conf.level = 0.99, mu=87, alt="less")


# ==========================
# 모비율 검정  p.176 
# ==========================

n<-3000
x<-1578
phat<- x/n
p0 <- 0.5

se <- sqrt(p0*(1-p0)/n)

Z0 <- (phat - p0) /se 
pval <- 2*(1-pnorm(Z0))

# ......위의 과정들을 아래 함수로 간단히 요약 
# p-value가 0.004이므로 유의수준 5%에서 남아 출생률이 50%라고 볼 수 없다.
binom.test(x=1578, n=3000, p=0.5)


# ==========================
# 모분산 검정  p.176 
# ==========================

# install.packages("EnvStats")
library("EnvStats")


x <- c(226, 228, 226, 225, 232, 228, 227, 292, 225, 230)

xbar <- mean(x)
n<- length(x)

s2 = var(x)
sigma0 =1.5
chisq0 <- (n-1)*s2 / sigma0^2
CV <- qchisq(0.99, n-1)
pval <- 1-pchisq(chi20, n-1)
round( c(chisq0=chisq0, sample_var=s2, CV=CV, p_value=pval), 3)





varTest(x, alt="greater", conf.level = 0.99, sigma.squared = 1.5^2)
