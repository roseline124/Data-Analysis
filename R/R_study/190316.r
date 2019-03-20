R.andom.team <- function() {
  # Assigns teams randomly from attendance file.
  # 
  # Args:
  #   fileName: Attendance file whose students sample is to be assigned
  #   leaders : Criteria for dividing teams 
  #
  # Returns:
  # Data frame of team randomly assigned 
  # error handling: 
  library(readxl)
  require(dplyr)
  table <- read_excel("R_study/students.xls", na="", skip=11, col_names=FALSE)  
  df <- getTidyData(table)
  
  #input team leaders
  leaders <- readline(prompt="팀장을 입력하세요. ex) 김철수 김영희 > ") 
  #vectorize list
  leaders <- unlist(strsplit(leaders, " "))  
  
  c(leaders_group, mates_group) <- devideGroups(df)
  
  #assign team numbers to leaders
  team_seq <- seq(1,length(leaders))
  leaders_group["team"] <- team_seq 
  
  #random shuffle mates
  mates_group <- row.shuffle(mates_group)
  
  #assign team numbers to mates
  rep_team <- rep(team_seq, length(leaders))
  mates_group["team"] <- rep_team[1:nrow(mates_group)] 
  
  #row bind leaders_group and mates_group
  rand_teams <- rbind(leaders_group, mates_group)
 
  #slicing id
  rand_teams["id"]<- unlist(mutate( floor(rand_teams["id"]/1e+06) ))   

  #show team
  all_team <- group_by(rand_teams, team) 
  slice(t,1:nrow(all_team)) 
  
}





############################################

#학과 바꾸기 
all_team %>%
  group_by_if(function(x) any(x == "광고홍보학과")) %>%
  summarise(count = n()) %>%
  as.data.frame()


#팀 보여주기  
all_team <- group_by(rand_teams, team) 
all_team
slice(t,1:nrow(all_team)) 

#팀 보여주기2
for(i in team_seq) { #team_seq : 1,2,3,4
  all_team %>% 
    all_team[all_team$team %in% i, ] %>%
    
    
}
team_x <- all_team[all_team$team %in% i,]
print(team_x)


#학과, 학번은 어떻게 할까? -> 타과생은 1, 나머지 0 // 학번은 평균 내기
#factor
tmp <- all_team
tmp$major[!(tmp$major=="광고홍보학과")] <- 1
tmp$major[tmp$major=="광고홍보학과"] <- 0
tmp

#팀별 학번 평균 
aggregate(rand_teams["id"], by=rand_teams["team"], mean )

#타과생 
aggregate(tmp["major"], by=tmp["team"], sum)



#이걸로 팀마다 학과를 세는 건 어떨까?
all_team %>%
  group_by_if(function(x) any(x == "광고홍보학과")) %>%
  summarise(count = n()) %>%
  as.data.frame()

#학번 슬라이싱
rand_teams %>%         
  mutate( floor(id/1e+06) ) %>% 
  group_by_if(function(x) any(x == "2013")) %>%
  summarise(count = n()) %>%
  as.data.frame()










getTidyData <- function(table) {
  #slicing
  data <- table[, c(4,6,7)]
  data <- na.omit(data)  
  
  #rename 
  colnames(data) <- c("major", "id", "name")
  
  return(data)
}


devideGroups <- function(df){
  #leader group
  leaders_group <- df[df$name %in% leaders, ]
  
  #team mates group
  mates_group <- df[!df$name %in% leaders, ]
  
  return(leaders_group, mates_group)
}


#random shuffle
row.shuffle <- function(df) {
  shuffled_df <- df[sample(nrow(df)), ]
  return(shuffled_df)
}


require(dplyr)

#학과 바꾸기 
all_team %>%
  group_by_if(function(x) any(x == "광고홍보학과")) %>%
  summarise(count = n()) %>%
  as.data.frame()


#팀 보여주기  
all_team <- group_by(rand_teams, team) 
slice(t,1:nrow(all_team)) 

#팀 보여주기2
for(i in team_seq) { #team_seq : 1,2,3,4
  all_team %>% 
    all_team[all_team$team %in% i, ] %>%
    
    
}



summarize.team <- function(all_team) {
  tmp <- all_team
  tmp$major[!(tmp$major=="광고홍보학과")] <- 1
  tmp$major[tmp$major=="광고홍보학과"] <- 0
  
  #mean of id by team
  aggregate(rand_teams["id"], by=rand_teams["team"], mean )
  
}

#학과, 학번은 어떻게 할까? -> 타과생은 1, 나머지 0 // 학번은 평균 내기


#팀별 학번 평균 


#타과생 
aggregate(tmp["major"], by=tmp["team"], sum)



#이걸로 팀마다 학과를 세는 건 어떨까?
all_team %>%
  group_by_if(function(x) any(x == "광고홍보학과")) %>%
  summarise(count = n()) %>%
  as.data.frame()

#학번 슬라이싱
rand_teams %>%         
  mutate( floor(id/1e+06) ) %>% 
  group_by_if(function(x) any(x == "2013")) %>%
  summarise(count = n()) %>%
  as.data.frame()

team_x <- all_team[all_team$team %in% i,]
print(team_x)






