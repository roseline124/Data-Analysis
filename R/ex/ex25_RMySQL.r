# install.packages(RPostgreSQL)
# install.packages(RMySQL)
# library(RMySQL)

mydb <- dbConnect(MySQL(), user='root', password='5553', dbname='sampdb')
result <- dbGetQuery(mydb, 'show tables;')
dbGetQuery(mydb, 'select count(*) from president;')

tbl <- dbGetQuery(mydb, 'select * from president;')

#성, 이름, 미들네임을 합친 새로운 name 컬럼 만들기 
tbl$name <- paste(tbl$first_name, tbl$last_name, tbl$suffix)

newdf <- tbl[c(8, 4:7)]
newdf$name <- gsub('NA', '', newdf$name)
newdf

#타입 캐스팅 
newdf$state <- as.factor(newdf$state)
newdf$birth <- as.Date(newdf$birth)
newdf$death <- as.Date(newdf$death)
str(newdf)
summary(newdf)

#disconnect #데이터는 날아가지 않는다. 
dbDisconnect(mydb)
