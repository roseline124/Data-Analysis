x <- 'what is your name?'
y <- "what's your name?" 


#character
y <- character()
z <- ""

class(y)
class(z)

length(y) #0
length(z) #1

char_ten <- character(10)
char_ten[1] <- "A"
char_ten

#check type
n = 3
c = "3"

is.character(n)
is.character(c)

class(n)
class(c)

#convert type (temporary)
as.character(n)

t <- c(1:4, TRUE, FALSE)
t

t2 <- c(1:4, TRUE, FALSE, "a")
t2

#dataframe
df <- data.frame(n=c(1:3), letters=c("a","b","c"))
str(df)