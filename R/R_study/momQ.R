library(readxl)
library(dplyr)

# subset(mq, 회원번호==주문결제일)

mq <- read.csv("momq_2018.csv")


View(mq)

str(mq)

class(mq$주문결제일시)
apply(mq$주문주문결제일시, substr)

mq["주문결제일"] <- substr(mq$주문결제일시, 1,10)
mq["주문결제일"]   

mq %>%
  group_by(회원번호, 주문결제일) %>%
  tally()


mq$주문결제일시

###### 연관성 분석 

# http://www.dodomira.com/2016/02/15/r%EC%9D%84-%EC%82%AC%EC%9A%A9%ED%95%9C-%EC%97%B0%EA%B4%80%EC%84%B1-%EB%B6%84%EC%84%9D-association-rules-in-r/

table(mq$대표아이월령)

library(arules)



mq$bin.회원번호 <- discretize(mq$회원번호, )

head(mq$bin.회원번호)

length((mq$회원번호))

# 상위브랜드 연관성 분석 
rioter.list <- split(mq$카테고리, mq$회원번호)

rioter.transaction <- as(rioter.list, "transactions")
rioter.transaction 

head(rioter.list)

rules <- apriori(rioter.transaction, parameter=list(support=0.1, minlen=2), control=list(verbos=F))
rules

# head(rules)

# names(mq)

# summary(rules)

rule.list <- as.data.frame(inspect(rules))
rule.list <- rule.list[order(rule.list$lift, decreasing=TRUE), ]
rule.list

# unique(mq$카테고리)


inspect(sort(rules)[1:10])

#### 시각화 
# https://m.blog.naver.com/PostView.nhn?blogId=leedk1110&logNo=220788082381&proxyReferer=https%3A%2F%2Fwww.google.com%2F

# install.packages("arulesViz")
library(arulesViz)
plot(rules,method="graph")

plot(rules,method="paracoord")
