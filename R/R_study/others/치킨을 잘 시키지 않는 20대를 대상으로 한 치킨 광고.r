#치킨을 잘 시키지 않는 20대를 대상으로 제작한 치킨 광고를 서울 어디에 뿌려야 할까..?#

setwd("C:/Users/WIN8/Documents")
jt <- read.csv("chicken1.csv", header = T)
View(jt)
head(jt)
mode(jt); class(jt)
range(jt$"통화건수")
library(dplyr)
jt1 <- filter(jt, 연령대 == "20대")

#치킨을 잘 시키지 않는 20대를 대상으로 만들었기 때문에 20대만 따로 분류

View(jt1)

#한 달 동안 어디서 20대의 통화건수 가장 적었는지 살펴보기.

library(plotly)
plot_ly(x = jt1$시군구, y = jt1$통화건수, frame = jt1$기준일)

#한 달 동안 꾸준히 통화건수가 적은 지역을 발견

summary(jt1$"통화건수")
library(COUNT)
jt1Call <- myTable(jt1$통화건수)
plot(x = jt1Call$x, y = jt1Call$Freq)

#한 달에 통화를 5건만 거는 20대가 압도적으로 많음을 확인

jt2 <- jt1[jt1$통화건수 == 5,] #통화 건수가 5건인 사람들을 따로 분류
View(jt2)
arrange(myTable(jt2$시군구), desc(Freq))
df.jt2gu <- data.frame(arrange(myTable(jt2$시군구), desc(Freq)))
summary(df.jt2gu)
plot(x = df.jt2gu$Freq)
head(df.jt2gu, 7)
