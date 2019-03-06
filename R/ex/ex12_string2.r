copied <- paste("Hi, Jack")
paste(copied, "what's up?")

paste("jac", "k", sep="")

#1학년 1반 ~ 10반
paste("1", 1:10, sep="-")

no_quote<- paste("The value of 'pi' is", pi)

# delete " "
noquote(no_quote)

#mtcars dataset
mtcars
car_rows <- rownames(mtcars)
car_colm <- colnames(mtcars)

#length of character
nchar(car_rows)

#most longest length
car_rows[which(nchar(car_rows)==max(nchar(car_rows)))]