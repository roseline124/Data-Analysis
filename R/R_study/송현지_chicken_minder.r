library(dplyr)
library(COUNT)
library(readxl)
library(plotly)
library(tidyverse)
library(gapminder)
source("clean_chicken_data.R", encoding = 'utf-8')

############# Chicken Data ##############
years <- c(2013, 2014, 2015, 2016, 2017)

# Rbind all chicken files
chs <- data.frame()
  
for(y in years) {
    tmp <- clean_chicken_data(y)
    chs <- rbind(chs, tmp)
}

head(chs)
tail(chs)

# 연도별, 분기별, 시군구, 통화건수 
ch_by_quater <- chs %>% 
  group_by(연, 분기별, 시군구) %>% 
  summarise(통화건수 = mean(통화건수))

View(ch_by_quater)

head(ch_by_quater)
tail(ch_by_quater)

############# Seoul Population Data ##############
seoul_pop <- read_excel("dataset/seoul_pop.xlsx", skip=1)

# Remove ',' in columns & Type casting
seoul_pop$세대 <- gsub('[,]', '', seoul_pop$세대)
seoul_pop$계 <- gsub('[,]', '', seoul_pop$계)

# mean of 세대당 인구 by 기간별, 구별
pop_by_quater <- seoul_pop %>% 
  group_by(기간, 자치구) %>% 
  summarise(세대당인구 = mean(세대당인구))

# Cbind Chicken, Seoul Population
df <- cbind(ch_by_quater, pop_by_quater)

# Indexing
df2 <- df[, c(5,3,4,7)]

# 세대, 계 
df2 <- cbind(df2, seoul_pop[c("세대", "계")])
df2["세대"] <- as.numeric(as.character(df2$세대))
df2["계"] <- as.numeric(as.character(df2$계))

# Plot
p <- df2 %>%
  plot_ly(
    x = ~세대당인구, 
    y = ~통화건수, 
    size = ~세대,
    color = ~시군구,
    frame = ~기간, 
    text = ~시군구, 
    hoverinfo = "text",
    type = 'scatter',
    mode = 'markers'
  ) %>%
  layout(
    xaxis = list(
      type = "log"
    )
  )

ggplotly(p, tooltip = "text")
