year <- c(2000, 2001, 2002, 2003, 2004)
value <- c (2.3, 3.2, 5.1, 5.4, 5.8)

plot(year, value)

fit <- lm(value ~ year) 
fit

abline(fit, col="red")

fit$coefficients[[1]]
fit$coefficients[[2]]

#오차 구하기
fit$residuals

#summary
#p-value(우연히 이렇게 될 확률)가 0.05이하이면 통계적으로 의미가 있다.
#R-squared : 클 수록 통계적으로 의미가 있다. 
# * : 통계적으로 의미가 있다. 
summary(fit)
