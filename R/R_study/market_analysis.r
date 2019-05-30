# install.packages("RcolorBrewer")
library(arules)
library(arulesViz)
library(RColorBrewer)
library(readxl)
library(dplyr)

#데이터 호출
MQ <- read_excel("momq_fin.xlsx")
RE.user <- read_excel("rebuy.xlsx")

# 재구매 회원만 필터링 
re.mq <- MQ %>% filter(회원번호 %in% RE.user$회원번호)
nrow(re.mq)

re.mq["주문결제일"] <- substr(re.mq$주문결제일시, 1,10)
head(re.mq)
# ================================
# 장바구니 분석 
# ================================

library(arules)


# re.mq3 <- re.mq %>% group_by(re.mq$회원번호,re.mq$주문결제일)

set.seed(2017)
options("scipen" = 100)

View(re.mq2)

mq2 <- split(re.mq$카테고리, re.mq$회원번호)
mq3 <- sapply(mq2, unique)
View(mq3)

rioter.transaction <- as(mq3,"transactions")

# head(rioter.list)

rules <- apriori(rioter.transaction, parameter=list(support=0.0001, minlen=2), control=list(verbos=F))
rules

# rule.list
rule.list <- as.data.frame(inspect(rules))
rule.list <- rule.list[order(rule.list$lift, decreasing=TRUE), ]
rule.list

# 결과 보기 
inspect(sort(rules)[1:10])

library(arulesViz)
plot(rules,method="graph")

plot(rules,method="paracoord")










data.trans

data.rule <- apriori(data = data.trans,parameter = list(support=0.001,confidence=0.01))
summary(data.rule)

aa <- inspect(sort(data.rule, by = "lift"))

library(arulesViz)
plot(sort(data.rule, by = "lift")[8:21],method = "graph")
