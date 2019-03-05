# read file 
# read.table(file.choose()) : you can choose file in window
# you can write 'True' to 'T'
# read.table -> text file
nba <- read.table(file="dataset/nba2013.csv", header=TRUE, fill=TRUE)
head(nba)
tail(nba)

#read.csv -> csv file
nba <- read.csv(file="dataset/nba2013.csv", header=TRUE, fill=TRUE)
head(nba)

#brefing data : str()
str(nba)


max(nba$Weight)
mean(nba$Weight)
mean(nba$Age)
