#info mtcars
class(mtcars)
str(mtcars)

#slice
newdata <- mtcars[1:2]
newdata

#check value 
newdata$cyl==4

#pick up rows where the number of cylinder is 4
mpg_4 <- newdata[which(newdata$cyl==4),]
mpg_6 <- newdata[which(newdata$cyl==6),]
mpg_8 <- newdata[which(newdata$cyl==8),]
mean(mpg_4$mpg)

#column bind
cbind(
    mean(mpg_4$mpg),
    mean(mpg_6$mpg), 
    mean(mpg_8$mpg)
)

#help function : '?function' 
?tapply

#tapply
#pick up rows부터 cbing까지의 과정을 거칠 필요없이 tapply를 쓰면 된다.
tapply(newdata$mpg, newdata$cyl, mean)
tapply(mtcars$mpg, mtcars$gear, mean)

#sapply, lapply 등 데이터 타입에 따라 쓰이는 apply가 다름.