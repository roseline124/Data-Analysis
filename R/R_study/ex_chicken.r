# colnames(df) <- c("Date", "DayofWeek", "gender", "age", "si", 'gu','dong', 'category', 'calls')

library(tidyverse)
library(plotly)
library(gapminder)

df <- read.csv('dataset/chicken.csv', 
               header=T,
               fileEncoding = 'euc-kr',
               encoding = 'utf-8') 

# Cleaning Data 
# 기준일 -> 연 / 월 / 일 
date <- as.Date(as.character(df$기준일), format = "%Y%m%d")
lt <- unclass(as.POSIXlt(date))
df$기준일 <- with(lt, data.frame(날짜 = date
                                , 연 = year + 1900
                                , 월 = mon + 1
                                , 일 = mday))

# 성별 -> 남 = 1, 여 = 0
df$성별 <- factor(df$성별, 
                  levels=c('남', '여'))
levels(df$성별) <- c(1, 0)

# 요일 -> 월 = 1, 일 = 7
df$요일 <- factor(df$요일, 
                  levels=c('월', '화', '수', '목', '금', '토', '일'))
levels(df$요일) <- c(1, 2, 3, 4, 5, 6, 7)
head(df)
View(df)

####################이 위까지 함.
head(df$연령대)

p <- df %>%
  plot_ly(
    x = ~gdpPercap, 
    y = ~lifeExp, 
    size = ~pop, 
    color = ~continent, 
    frame = ~year, 
    text = ~country, 
    hoverinfo = "text",
    type = 'scatter',
    mode = 'markers'
  ) %>%
  layout(
    xaxis = list(
      type = "log"
    )
  )
