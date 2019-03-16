library(readxl)

students <- read_excel("R_study/students.xls", na="", skip=11, col_names=FALSE)

#slicing data
data <- students[, c(4,6,7)]
data <- na.omit(data)





#인덱싱 :  View(students[1:17, c(2,4,6,7)])
data <- students[1:17, c(4,6,7)] #nrow를 쓰자.
#data <- students[!is.na(students), c(4,6,7)]

#colnames(df)[2:4] <- c("인구", "소득", "변화")
#names(data) <- c("major", "id", "name")
colnames(data) <- c("major", "id", "name")

#input team leaders
leaders <- readline(prompt="팀장을 입력하세요. ex) 김철수 김영희 > ")

leaders <- unlist(strsplit(leaders, " ")) #vectorize list

#leader group
leader_group <- data[(data$name %in% leaders), ]

#team mates group
mates_group <- data[!(data$name %in% leaders), ]

#leader column 
tmp <- data
tmp["leader"] <- data$name %in% leaders
tmp

#돌려돌려 돌려판~! 
#sample(x,y) x개중 y를 무작위로 추출한다.
rand_st <- tmp[sample(nrow(tmp)),]
rand_st



#assgin team leaders
team_seq <- seq(1,length(leaders))

l_group <- leader_group
l_group["team"] <- team_seq

l_group

#assgin team mates
m_group <- mates_group
rand_m <- m_group[sample(nrow(m_group)),]
rand_m

rep_team <- rep(team_seq, length(leaders))

rand_m["team"] <- rep_team[1:nrow(rand_m)]

l_group
rand_m

#l_gruop, m_group 결합
# https://m.blog.naver.com/PostView.nhn?blogId=coder1252&logNo=220953760651&proxyReferer=https%3A%2F%2Fwww.google.com%2F

rand_teams <- rbind(l_group, rand_m)
rand_teams


# https://stackoverflow.com/questions/27954795/using-r-randomly-assigning-students-into-groups-of-4
require(dplyr)
#random_4 <- df %>% group_by(Section) %>% slice(sample(c(1,2),1))

#keyword : r random assgin groups
t <- group_by(rand_teams, team) 
slice(t,1:5) # 5 -> nrow(l_group) + 1



#학과, 학번은 어떻게 할까? -> 타과생은 1, 나머지 0 // 학번은 평균 내기
#factor
#factor(rand_teams$other_majors, levels=0:1)
#rand_teams["other_majors"] <- rand_teams$major != "광고홍보학과"

#group_by_if : https://stackoverflow.com/questions/46439781/how-to-group-by-on-column-index-in-dplyr   
#이걸로 팀마다 학과를 세는 건 어떨까?
rand_teams %>%
  group_by_if(function(x) any(x == "광고홍보학과")) %>%
  summarise(count = n()) %>%
  as.data.frame()

rand_teams %>%         
  mutate( floor(id/1e+06) ) %>% 
  #  head %>%
  group_by_if(function(x) any(x == "2013")) %>%
  summarise(count = n()) %>%
  as.data.frame()

rand_teams["id"]<- unlist(mutate( floor(rand_teams["id"]/1e+06) ))
rand_teams

#팀별 학번 평균 
aggregate(rand_teams["id"], by=rand_teams["team"], mean )

#######################








