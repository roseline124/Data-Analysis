#uniform distribution simulate
# p = 1/n, n of die*6
roll <- 1000
face <- 6 

# runif(roll) #from 0 to 1 

die <- runif(roll)*face 
die <- ceiling(die)

# how many?
result <- table(die)
barplot(result)