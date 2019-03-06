mtcars
car_rows <- rownames(mtcars)
car_colm <- colnames(mtcars)

#length of character
nchar(car_rows)

#most longest length
car_rows[which(nchar(car_rows)
        ==max(nchar(car_rows)))]

#find specific character
grep("z", car_rows, value=TRUE)

#소문자, 대문자 다르다.
grep("[vV]", car_rows, value=TRUE)

#convert to -case (tolower, toupper)
grep("toyota", tolower(car_rows), value=TRUE)

# install.packages("stringr") 
library(stringr)

#각각의 값들이 t를 얼마나 갖고 있는가. 
str_count(tolower(car_rows), "t")
sum(str_count(tolower(car_rows), "t"))
