region <- c(32, 37, 38, 30, 42, 35, 26, 28, 36, 33, 27, 25)
df <- data.frame(region)
df

# 평균, 중앙값
summary(df)

# 최빈값 함수
getMode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

# 최빈값
getMode(df$region)

# 변량, 표준편차

var(df$region)
sd(df$region)

boxplot(df$region)$stats


IQR(df$region)


# Calculating IQR

quantile(df$region)

iqr <- IQR(df$region)
iqr

1.5*iqr 

8.5+ 32.5
32.5 - 8.5


1- pnorm(q=4400, mean=4000,sd=200) 


+ dnorm(x=4400, mean=4000, sd=200)

1- pnorm(q=110, mean=100, sd=6)


1-0.9772

sigma <- 5
n <- 100 

alpha <- 0.05

alpha/2

# 표본 평균의 표준오차 

se <- sigma/sqrt(n)
qnorm(alpha/2, lower.tail = F)

error <- qnorm(alpha/2, lower.tail = F)*se
error

lower <- round(35-error, digits=3)
lower

upper <- round(35+error, digits=3)
upper
c(lower, upper)

# 

se <- sd(5)/sqrt(16)
se

t.test(conf.level=0.95, mu=36, alt="equal")


###########################

male <- c(11, 17, 14, 10, 13, 11, 17, 10, 19, 14)
female <- c(10, 13, 12, 15, 18, 14, 14, 17, 17, 10)

df <- data.frame(male, female)
df

hist(df$male, prob=T)
hist(df$female)

qqnorm(df$male)
qqline(df$male, col="red")

qqnorm(df$female)
qqline(df$female, col="red")

t.test(df$male, df$female, var.equal = T)

shapiro.test(df$male)

shapiro.test(df$female)


cohen.d(df$male)

cohens_d <- function(x, y) {
  lx <- length(x)- 1
  ly <- length(y)- 1
  md  <- abs(mean(x) - mean(y))        ## mean difference (numerator)
  csd <- lx * var(x) + ly * var(y)
  csd <- csd/(lx + ly)
  csd <- sqrt(csd)                     ## common sd computation
  
  cd  <- md/csd                        ## cohen's d
  return(cd)
  }

result <- cohens_d(df$male, df$female)
result

##########

control <- c(0,1,0,3,1,2,4,2)
day_1 <- c(1,3,2,2,4,6,3,4)
day_2 <- c(5,4,7,8,6,3,2,5)
day_3 <- c(7,1,6,9,10,12,8,7)

df <- data.frame(control,day_1, day_2, day_3)
df

shapiro.test(df$control)
shapiro.test(df$day_1)
shapiro.test(df$day_2)
shapiro.test(df$day_3)


<br>


library(car)
y <- c(df$day_1, df$day_2, df$day_3) 
group <- as.factor(c(rep(1, length(df$day_1)), 
                     rep(2, length(df$day_2)),
                     rep(3, length(df$day_3)))) 

leveneTest(y, group)

t.test(df$control, df$day_1, df$day_2, df$day_3, mu=, paired = T)

y

t.test(df$control, df$day_3, var.equal=T, conf.level = 0.95)

role <- c("main", "support", "back")
age <- c("child", "old")

<- table(role)




