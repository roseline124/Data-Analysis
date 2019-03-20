R.andom.team <- function(fileName, leaders, times=1) {
  # Assigns teams randomly from attendance file.
  # 
  # Args:
  #   fileName: file must be '.xls' or '.xlsx' format and below working directory
  #   leaders : vector of leaders' name for assigning teams 
  #   times : How many times the teams will be shuffled?
  #
  # Returns: 
  #   Data frame of team randomly assigned 
  library(readxl)
  
  # Get filePath 
  wd_path <- getwd()
  filePath <- paste(wd_path,"/", fileName, sep="")  
  
  tryCatch(raw_df <- read_excel(filePath, na="", skip=11, col_names=FALSE), 
           error=function(e) print("파일이 작업 폴더 안에 있는지, 또는 확장자를 확인해주세요."),
           warning=function(w) print("warning! warning!"),
           finully=NULL)
  
  # Indexing
  df <- raw_df[, c(4,6,7)]
  df <- na.omit(df)  
  
  # Rename columns
  colnames(df) <- c("major", "id", "name")
  print(df)
  
  # Devide groups into two groups(leaders, mates)
  l_df <- df[df$name %in% leaders, ]
  m_df <- df[!df$name %in% leaders, ]
  
  # Assign team numbers to leaders
  team_num <- seq(1,length(leaders))
  l_df["team"] <- team_num 
  
  # Random shuffle mates
  for(n in seq(times)){
    m_df <- m_df[sample(nrow(m_df)), ]
  } 
  # Assign team numbers to mates 
  
  rep_num <- rep(team_num, (round(nrow(m_df)/length(team_num)))+1)
  m_df["team"] <- rep_num[1:nrow(m_df)] 
  
  # Row bind leaders_group and mates_group
  rand_teams <- rbind(l_df, m_df)
  
  ########## Show result ##########  
  require(dplyr)
  
  # Slicing id : 2014047538 -> 14
  rand_teams["id"]<- unlist(mutate( (floor(rand_teams["id"]/1e+06)) %% 2000 ))  
  
  # Change string to integer
  tmp <- rand_teams
  tmp$major[!(tmp$major=="광고홍보학과")] <- 1
  tmp$major[tmp$major=="광고홍보학과"] <- 0
  tmp$major <- as.numeric(tmp$major)
  
  # Show team result
  rand_teams <- rand_teams[order(rand_teams$team),]
  
  print("랜덤 팀")  
  for( i in team_num){
    print(filter(rand_teams, team==i))
  }
  
  # Mean of id by team
  print("팀별 평균 학번")
  print(aggregate(rand_teams["id"], by=rand_teams["team"], mean ))
  
  # Other majors in each team 
  print("팀별 타과생 수")
  print(aggregate(tmp["major"], by=tmp["team"], sum)) 
  
  return(rand_teams)  
}

leaders <- c("김주환","송현지", "정서윤", "주준태")
R.andom.team("R_study/students.xls",leaders)
