library(arules)
library(arulesViz)
library(RColorBrewer)
library(readxl)
library(dplyr)
library(stringr)

MQ <- read_excel("momq_2018.xlsx")
head(MQ)






set.seed(2017)
options("scipen" = 100)

mq <- split(MQ$CTG_3, MQ$회원번호)

mq <- na.omit(mq)

length(mq)

lapply(mq, function(x) write.table( data.frame(x), '2018_basket.csv'  , append= T, sep=',' ))



View(data.frame(mq))





mq2 <- sapply(mq, unique)

str(mq2)

df <- data.frame(matrix(unlist(mq), nrow=length(mq), byrow=F),stringsAsFactors=FALSE)
View(df)

head(mq, 30)
head(matrix(unlist(mq)), 30)


# str_split_fixed(mq2$, "_and_", 2)

length(mq2)

mq2.T

write.csv(mq2, file="for_market_busket" , row.names=F)
