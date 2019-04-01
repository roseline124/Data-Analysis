a <- rep("A", 20);a
b <- rep("B", 30)
c <- rep("C", 10)

# a : 20표, b : 30표, c : 10표
x <- c(a, b, c)
x
y <- as.matrix(table(x))
y

freq <- y[,1]
freq

relative_freq <- freq/sum(y)
relative_freq

z <- cbind(freq, relative_freq)
z


# 파이 촤트
x <- c(1520, 770, 510)

# digits : 소수점 1자리까지 나타낼 
y <- round(x/sum(x)*100, digits = 1)
y

lab <- c("A", "B", "C")
w <- paste(lab, "(", y, "%",")")

pie(x, labels=w, main="파이촤트")


length(x)


##############양적 자료##########
# 히스토그램
data()
hist(faithful$waiting)

# 줄기-잎 그림(stem-and-leaf)
# 십의 자리 | 일의 자리 
# ex) 4 | 666777 : 46 46 46 47 47 47
stem(faithful$waiting)

# ddhlsWhr 


