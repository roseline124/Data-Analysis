library(tidyverse)
library(plotly)
library(COUNT)

df <- read.csv('dataset/chicken.csv', 
               header=T,
               fill=T,
               fileEncoding = 'euc-kr',
               encoding = 'utf-8') 
unique(df$시군구)


# Cleaning Data 
#group date
df$date <- cut(df$기준일, seq(20190101,20190131,7),right = F)

levels(df$date) <- c("w1","w2","w3","w4")
myTable(df$date)

df$re.date <- cut(df$기준일, 
                  br=c(20190100,20190106,20190113,20190120,20190127,20190132),
                  labels=c("w1","w2","w3","w4","w5"))

myTable(df$re.date)
df$re.date

head(df)

df2 <- cbind(df[,11:13], df[,2:4], df[,6:7], df[9])

# 성별 -> 남 = 1, 여 = 0
levels(df2$성별) <- c(1, 0)

# 요일 -> 월 = 1, 일 = 7
levels(df2$요일) <- c(1, 2, 3, 4, 5, 6, 7)

# 연령대 
levels(df2$연령대) <- c(10, 20, 30, 40, 50, 60)


##################3


names(df)
str(df)

myTable(df$성별)
myTable(df$연령대)

summary(df$기준일)
range(df$기준일)

#group date
df$date <- cut(df$기준일, seq(20190101,20190131,7), right=F)
df$date

levels(df$date) <- c("w1","w2","w3","w4")
myTable(df$date)
