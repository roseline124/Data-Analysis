
data <- read.csv("dataset/all_sample.csv", stringsAsFactors = F, header = T)

install.packages("KoNLP")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("plotly")

library(KoNLP)
useSejongDic()
library(dplyr)
library(ggplot2)
library(plotly)

sen <- subset(data, subset = (data[6]==1 | data[6]==2)) # 1: 루머 , 2: 제외 (0: 뉴스 기사를 제외한 사람들의 여론)

sen <- sen[4]
sb <- sapply(sen[1], extractNoun, USE.NAMES = F)
undata <- unlist(sb)
head(undata)

tmp_data <- Filter(function(x){nchar(x)>=3}, undata)
head(tmp_data)
tmp_data <- gsub("\\^", "", tmp_data)
tmp_data <- gsub("ㅋ", "", tmp_data)
tmp_data <- gsub("ㅠ", "", tmp_data)
tmp_data <- gsub("^메르스\\s+", "", tmp_data)
tmp_data <- gsub("메르스가", "", tmp_data)
tmp_data <- gsub("메르스", "", tmp_data)
tmp_data <- gsub("메르스는", "", tmp_data)
tmp_data <- gsub("는", "", tmp_data)
tmp_data <- gsub("에", "", tmp_data)
tmp_data <- gsub("\\d", "", tmp_data)
tmp_data <- gsub("URLURL", "", tmp_data)
tmp_data <- gsub("URLUR", "", tmp_data) 

TB = tmp_data 

wordcount<- table(TB)
wordcount <- sort(wordcount, decreasing = T)

wordcount = data.frame(head(wordcount,30))

result <- wordcount %>% 
    select(TB) %>%
    filter(wordcount$TB != '') # top 30 단어 확인 

df <- subset(data, subset = (data[6]==1 | data[6]==2)) # 1: 루머 , 2: 제외 (0: 뉴스 기사를 제외한 사람들의 여론)

head(df)


f = list('박근혜','때문','대통령','마스크','바이러스','박원순','mers','감염자','사망자','사람들','탄저균','네이버','면역력','실시간','전염병','amp','이야기','서울병원','확진자','청와대','여러분','의료진','우리나라')

r_text <- function(text){ # list에 포함된 글자가 파악되면 체크 
    for (i in 1:length(f)){
        if (grepl(f[i],text)){
            return(as.character(f[i]))
        }
    }
}

head(df)

df$tw2 = sapply(df$tw, r_text, USE.NAMES = F)

df<- df %>%
filter(df$tw2 != 'NULL')

df <- df[,c('date', 'tw2')]

df$date <- sapply(strsplit(df$date, ' '), function(x) x[1], simplify=FALSE) # 날짜 정제 

df$date = as.character(df$date) # convert list to character 

df$tw2 = as.character(df$tw2)

str(df)

result <- df %>% 
    group_by(date, tw2) %>%
    summarise(n = n())

result$date <- gsub("/","",result$date)

result$date <- gsub("2015","",result$date)

tmp1 = head(result,100)

head(tmp1)

tmp1 %>% 
    group_by(date)  %>%  
    mutate(ra = rank(-n, ties.method = 'first'))        

last_result <- result %>% 
    group_by(date)  %>%  
    mutate(ra = rank(-n, ties.method = 'first'))        

last_result

p <- last_result %>% 
      plot_ly(
        x = last_result$tw2,
        y = last_result$ra, 
        size = last_result$n,
        frame = last_result$date,
        type = 'scatter',
        mode = 'bar'
       )

p


