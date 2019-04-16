# Chi-square goodness of fit
# class (), names()
# range() 
# chisq.test(table(df$column))


# Cross Tabulation 
# 성별과 연령대의 상관관계를 보려면 table로 새로 만든다.
# table(df$gender, df$age)

# chisq.test 에는 expected, observed 속성이 있어서 기대, 관찰 빈도 확인 가능 
# install.packages("exact2x2")
# fisher.exact()


# install.packages("vcd") # 그냥 chisq.test()보다 더 많은 정보를 준다. 
# assocstats() # association statistics 

library(ggplot2)

ggplot(data.frame(x=c(0,40)), aes(x=x)) +
  stat_function(fun=dchisq, args=list(df=2), colour="black", size=1.2) +
  geom_text(x=0.6, y=1, label="df=2") +
  
  stat_function(fun=dchisq, args=list(df=10), colour="blue", size=1.2) +
  geom_text(x=0, y=0.55, label="df=10") +
  
  stat_function(fun=dchisq, args=list(df=20), colour="red", size=1.2) +
  geom_text(x=0.5, y=0.05, label="df=20") +
  ggtitle("Chisq-Distribution")

