# colnames(df) <- c("Date", "DayofWeek", "gender", "age", "si", 'gu','dong', 'category', 'calls')

library(tidyverse)
library(plotly)
library(gapminder)

df <- read.csv('dataset/chicken.csv', 
               header=T,
               fill=T,
               fileEncoding = 'euc-kr',
               encoding = 'utf-8',
               skip=1) 

colnames(df) <- c("기준일", "요일", "성별", "연령대", "city", "시군구", "d", "c", "통화건수")

head(df)

str(df)

names(df)
# Cleaning Data 
# 기준일 -> 연 / 월 / 일 
date <- as.Date(as.character(df$기준일), format = "%Y%m%d")
lt <- unclass(as.POSIXlt(date))
df[, c("날짜", "연", "월", "일")] <- with(lt, data.frame(날짜 = date
                                , 연 = year + 1900
                                , 월 = mon + 1
                                , 일 = mday))

df2 <- cbind(df[,11:13], df[,2:4], df[,6:7], df[9])

head(df)
head(df2)

# 성별 -> 남 = 1, 여 = 0
df2$성별 <- factor(df2$성별, 
                  levels=c('남', '여'))
levels(df2$성별) <- c(1, 0)

# 요일 -> 월 = 1, 일 = 7
df2$요일 <- factor(df2$요일, 
                  levels=c('월', '화', '수', '목', '금', '토', '일'))
levels(df2$요일) <- c(1, 2, 3, 4, 5, 6, 7)
head(df2)
View(df2)

# 연령대 
df2$연령대 <- factor(df2$연령대, 
              levels=c('10대', '20대', '30대', '40대', '50대', '60대이상'))
levels(df2$연령대) <- c(10, 20, 30, 40, 50, 60)

#######quatile#############
df <- read.csv('dataset/chicken.csv', 
               header=T,
               fill=T,
               fileEncoding = 'euc-kr',
               encoding = 'utf-8') 

summary(df$통화건수)
hist(df$통화건수)


r <- df$통화건수
하 <- which(r <= quantile(r, 0.33, na.rm = T))
중 <- which(r <= quantile(r, 0.66, na.rm = T))
상 <- which(r <= quantile(r, na.rm = T)[5])
r[상]
r[중]
r[하]





#########describe#############
library(COUNT)

#Example
ch <- read.csv('dataset/chicken.csv', 
               header=T,
               fileEncoding = 'euc-kr',
               encoding = 'utf-8') 
names(ch)
str(ch)

myTable(ch$성별)
myTable(ch$연령대)

summary(ch$기준일)
range(ch$기준일)

#group date
ch$date <- cut(ch$기준일, seq(20190101,20190131,7),right = F)
ch$date


levels(ch$date) <- c("w1","w2","w3","w4")
myTable(ch$date)

ch$re.date <- cut(ch$기준일, 
                  br=c(20190100,20190106,20190113,20190120,20190127,20190132),
                  labels=c("w1","w2","w3","w4","w5"))

myTable(ch$re.date)
ch$re.date
######## 2.2 Making graphs

# Bar Plots
barplot(table(ch$re.date))
barplot(table(ch$re.date), horiz = T)

library(ggplot2)
ggplot(ch, aes(x=re.date)) + geom_bar(stat = "count")
qplot(re.date, data=ch, geom="bar")

# Pie chart
pie(table(guest.house), col= c("white","yellow","gray","blue","green"))

mytable <- table(ch$re.date)
date <- paste(names(mytable), "\n", mytable, sep="")
pie(mytable, labels = date, main="Pie Chart of Week (with sample sizes)")


library(plotrix)
pie3D(mytable,labels=date, explode=0.1, main="Pie Chart of Week (with sample sizes)")
pie3D(mytable,labels=date, explode=0.1, 
      col=c("white","gray90","yellow","sky blue","green"),
      main="Pie Chart of Week")

# Histogram
hist(table(hh$new))
hist(ch$기준일, breaks=6)
hist(ch$기준일, breaks=6, probability = TRUE, col = "gray90")
lines(density(ch$기준일))
par(family = "AppleGothic")
hist(ch$기준일, col = "gray90", breaks= seq(20190101, 20190131, by=5))
hist(ch$기준일, col = "gray90", breaks= seq(20190101, 20190131, by=5),
     main="An Example Histogram",
     xlab="THE X-AXIS LABEL", ylab="THE Y-AXIS LABEL")















####################이 위까지 함.

head(df2)
View(df2)

p <- df2 %>%
  plot_ly(
    x = ~연령대, 
    y = ~통화건수, 
    color = ~시군구, 
    frame = ~일, 
    type = 'scatter',
    mode = 'markers'
  ) 


ggplotly(p)













View(gapminder)

dat <- map_data("world", "canada") %>% group_by(group)

p <- plot_mapbox(dat, x = ~long, y = ~lat) %>%
  add_paths(size = I(2)) %>%
  add_segments(x = -100, xend = -50, y = 50, 75) %>%
  layout(mapbox = list(zoom = 0,
                       center = list(lat = ~median(lat),
                                     lon = ~median(long))
  ))



####################


# 20190325

date <- as.Date(as.character(ch_17$기준일), format = "%Y%m%d")
lt <- unclass(as.POSIXlt(date))
date_vector <- c("날짜", "연", "월", "일")
ch_17[, date_vector ] <- with(lt, 
                              data.frame(날짜 = date
                                           , 연 = year + 1900
                                           , 월 = mon + 1
                                           , 일 = mday))

# 190326 






min(df2$세대당인구)
max(df2$세대당인구)

p <- df2$세대당인구
하 <- which(p <= quantile(p, 0.33, na.rm = T))
중 <- which(p <= quantile(p, 0.66, na.rm = T))
상 <- which(p <= quantile(p, na.rm = T)[5])

p[상]
p[중]
p[하]


########

# as.factor
cols <- c("기간", "자치구")
seoul_pop[cols] <- lapply(seoul_pop[cols], factor)

head(seoul_pop)
names(seoul_pop)

unique(seoul_pop$기간)


# factor levels
unique(ch_2017$시군구)

# 기준일 
str_df <- read_excel("dataset/stress_14-17.xlsx")
head(str_df)

#############

# 연령별, 시군구, 통화건수 
ch_by_age <- chs %>% 
  group_by(연령대, 시군구) %>% 
  summarise(re.통화건수 = mean(통화건수))

head(ch_by_age)
tail(ch_by_age)

# 성별, 시군구 통화건수 
ch_by_sex <- chs %>% 
  group_by(성별, 시군구) %>% 
  summarise(re.통화건수 = mean(통화건수))


