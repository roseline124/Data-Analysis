x <- c(1,2,3,4,5,2,34,7,345,47,67,34,13,1253,645,73)

#logical operation : >, <
x > 5

#count attributes in that condition
sum(x>100)
sum((700>x) & (x>100))

#condition
z <- x[x>100]
sum(z)

#which : returns 'index'
which(x>100)

x[9]
x[14]
x[15]
