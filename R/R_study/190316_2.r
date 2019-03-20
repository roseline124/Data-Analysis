getTidyData <- function(table) {
  #slicing
  data <- table[, c(4,6,7)]
  data <- na.omit(data)  
  
  #rename 
  colnames(data) <- c("major", "id", "name")
  
  return(data)
}


summarize.team <- function(rand_teams){
  #slicing id : 2014047538 -> 14
  rand_teams["id"]<- unlist(mutate( (floor(rand_teams["id"]/1e+06)) %% 2000 ))  
  
  #change text to integer
  tmp <- all_team
  tmp$major[!(tmp$major=="광고홍보학과")] <- 1
  tmp$major[tmp$major=="광고홍보학과"] <- 0
  tmp$major <- as.numeric(tmp$major)
  
  #show team
  print(all_team[order(all_team$team),])
  
  #mean of id by team
  print(aggregate(rand_teams["id"], by=rand_teams["team"], mean ))
  
  #other majors in each team 
  print(aggregate(tmp["major"], by=tmp["team"], sum))   
}


#######################################


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
  table <- read_excel("R_study/students.xls", na="", skip=11, col_names=FALSE)  
  df <- getTidyData(table)
  print("df")
  print(df)
  
  #input team leaders
  leaders <- readline(prompt="팀장을 입력하세요. ex) 김철수 김영희 > ") 
  leaders <- unlist(strsplit(leaders, " "))  #vectorize list
  
  #devide groups into leaders group and mates group
  leaders_group <- df[df$name %in% leaders, ]
  mates_group <- df[!df$name %in% leaders, ]
  
  #assign team numbers to leaders
  team_seq <- seq(1,length(leaders))
  leaders_group["team"] <- team_seq 
  
  #random shuffle mates
  mates_group <- mates_group[sample(nrow(mates_group)), ]
  
  #assign team numbers to mates
  rep_team <- rep(team_seq, length(leaders))
  mates_group["team"] <- rep_team[1:nrow(mates_group)] 
  
  #row bind leaders_group and mates_group
  rand_teams <- rbind(leaders_group, mates_group)
  
  #show result  
  require(dplyr)
  summarize.team(rand_teams)
}


R.andom.team()


fact <- factor(levels = seq(1,10))
fact

###################################


summarize.team <- function(rand_teams, team_num){
  #slicing id : 2014047538 -> 14
  rand_teams["id"]<- unlist(mutate( (floor(rand_teams["id"]/1e+06)) %% 2000 ))  
  
  #change text to integer
  tmp <- rand_teams
  tmp$major[!(tmp$major=="광고홍보학과")] <- 1
  tmp$major[tmp$major=="광고홍보학과"] <- 0
  tmp$major <- as.numeric(tmp$major)
  
  #show team
  rand_teams <- rand_teams[order(rand_teams$team),]
  
  for( i in team_num){
    print(filter(rand_teams, team==i))
  }
  
  #mean of id by team
  print(aggregate(rand_teams["id"], by=rand_teams["team"], mean ))
  
  #other majors in each team 
  print(aggregate(tmp["major"], by=tmp["team"], sum))   
}


#######################################


R.andom.team <- function(leaders) {
  # Assigns teams randomly from attendance file.
  # 
  # Args:
  #   fileName: Attendance file whose students sample is to be assigned
  #   leaders : vector of leaders for assigning teams 
  # Returns:
  # Data frame of team randomly assigned 
  library(readxl)
  raw_df <- read_excel("R_study/students.xls",
                       na="", 
                       skip=11, 
                       col_names=FALSE)
  
  #slicing
  df <- raw_df[, c(4,6,7)]
  df <- na.omit(df)  
  
  #rename 
  colnames(df) <- c("major", "id", "name")
  print(df)
  
  #input team leaders
  leaders <- readline(prompt="팀장을 입력하세요. ex) 김철수 김영희 > ")
  leaders <- unlist(strsplit(leaders, " "))  #vectorize list
  
  #devide groups into two groups(leaders, mates)
  l_df <- df[df$name %in% leaders, ]
  m_df <- df[!df$name %in% leaders, ]
  
  #assign team numbers to leaders
  team_num <- seq(1,length(leaders))
  l_df["team"] <- team_num 
  
  #random shuffle mates
  m_df <- m_df[sample(nrow(m_df)), ]
  
  #assign team numbers to mates
  rep_num <- rep(team_num, length(leaders))
  m_df["team"] <- rep_num[1:nrow(m_df)] 
  
  #row bind leaders_group and mates_group
  rand_teams <- rbind(l_df, m_df)
  
  
  ########## show result ##########  
  require(dplyr)
  
  #slicing id : 2014047538 -> 14
  rand_teams["id"]<- unlist(mutate( (floor(rand_teams["id"]/1e+06)) %% 2000 ))  
  
  #change text to integer
  tmp <- rand_teams
  tmp$major[!(tmp$major=="광고홍보학과")] <- 1
  tmp$major[tmp$major=="광고홍보학과"] <- 0
  tmp$major <- as.numeric(tmp$major)
  
  #show team
  rand_teams <- rand_teams[order(rand_teams$team),]
  
  for( i in team_num){
    print(filter(rand_teams, team==i))
  }
  
  #mean of id by team
  print(aggregate(rand_teams["id"], by=rand_teams["team"], mean ))
  
  #other majors in each team 
  print(aggregate(tmp["major"], by=tmp["team"], sum)) 
}


R.andom.team()


rrfact <- factor(levels = seq(1,10))
fact

##################################



R.andom.team <- function(fileName, leaders) {
  # Assigns teams randomly from attendance file.
  # 
  # Args:
  #   fileName: Attendance file whose students sample is to be assigned
  #   leaders : vector of leaders for assigning teams 
  # Returns:
  # Data frame of team randomly assigned 
  library(readxl)
  
  #get filePath : file below working directory
  wd_path <- getwd()
  filePath <- paste(wd_path,"/", fileName, sep="")  
  
  tryCatch(raw_df <- read_excel(filePath, na="", skip=11, col_names=FALSE), 
           error=function(e) print("파일이 작업 폴더 안에 있는지 확인해주세요."),
           warning=function(w) print("warning! warning!"),
           finully=NULL
  )
  
  
  #slicing
  df <- raw_df[, c(4,6,7)]
  df <- na.omit(df)  
  
  #rename 
  colnames(df) <- c("major", "id", "name")
  print(df)
  
  #devide groups into two groups(leaders, mates)
  l_df <- df[df$name %in% leaders, ]
  m_df <- df[!df$name %in% leaders, ]
  
  #assign team numbers to leaders
  team_num <- seq(1,length(leaders))
  l_df["team"] <- team_num 
  
  #random shuffle mates
  m_df <- m_df[sample(nrow(m_df)), ]
  
  #assign team numbers to mates
  rep_num <- rep(team_num, length(leaders))
  m_df["team"] <- rep_num[1:nrow(m_df)] 
  
  #row bind leaders_group and mates_group
  rand_teams <- rbind(l_df, m_df)
  
  
  ########## show result ##########  
  require(dplyr)
  
  #slicing id : 2014047538 -> 14
  rand_teams["id"]<- unlist(mutate( (floor(rand_teams["id"]/1e+06)) %% 2000 ))  
  
  #change text to integer
  tmp <- rand_teams
  tmp$major[!(tmp$major=="광고홍보학과")] <- 1
  tmp$major[tmp$major=="광고홍보학과"] <- 0
  tmp$major <- as.numeric(tmp$major)
  
  #show team
  rand_teams <- rand_teams[order(rand_teams$team),]
  
  for( i in team_num){
    print(filter(rand_teams, team==i))
  }
  
  #mean of id by team
  print("팀별 평균 학번")
  print(aggregate(rand_teams["id"], by=rand_teams["team"], mean ))
  
  #other majors in each team 
  print("팀별 타과생 수")
  print(aggregate(tmp["major"], by=tmp["team"], sum)) 
}

leaders <- c("곽종현","송현지","김주환","윤준범")
R.andom.team("R_study/students.xls",leaders)








