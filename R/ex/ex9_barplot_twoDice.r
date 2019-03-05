#sum of two dice
roll <- 1000 
face <- 6
dice <- ceiling(runif(roll)*face) + ceiling(runif(roll)*face) 

result <- table(dice)
barplot(result)

result[1]*6
result[7]
