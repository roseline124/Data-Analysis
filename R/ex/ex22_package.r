#install.packages("MASS")
#library(MASS)
#data(Aids2)
str(Aids2)
?Aids2
head(Aids2)
summary(Aids2)

Aids2[which(Aids2$age==0),] #column은 비워둔다.

#Alive
Alive <- Aids2[which(Aids2$status=="A"),]
aggregate(Alive$age, by=list(Alive$sex), mean) #궁금한 것, 기준, 어떻게 나타낼 것인가.

#Dead
Dead <- Aids2[which(Aids2$status=="D"),]
aggregate(Dead$age, by=list(Alive$sex), mean) #궁금한 것, 기준, 어떻게 나타낼 것인가.

#한 번에 보는 법 
aggregate(Aids2$age, by=list(Aids2$sex, Aids2$status), meas)