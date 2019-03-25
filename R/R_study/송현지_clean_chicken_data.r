clean_chicken_data <- function(year) {
  library(readxl)
  
  dir_path <- paste("dataset/chicken_", year, sep="")
  files <- list.files(dir_path)
  
  ch <- data.frame()
  
  for (f in files) {
    print("####### DATA LOAD ... ########")
    print(f)
    
    ######## 데이터 로드 ########
    file_path <- paste(dir_path, f, sep="/")
    raw_df <- read_excel(file_path, skip=1)
    
    ######## 데이터 가공 ########
    # for문 밖에서 해도 되지만 메모리를 효율적으로 쓰기 위해.
    # 인덱싱 
    if(year==2017){
      idx <- c(1,2,3,4,6,9)
    } else {
      idx <- c(1,2,3,4,6,8)
    }
    tmp <- raw_df[, idx]
    colnames(tmp) <- c("기준일", "요일", "성별", "연령대", "시군구", "통화건수")
    
    # lapply : 여러 컬럼 한꺼번에 데이터타입 바꾸는 법
    cols <- c("성별", "연령대", "시군구")
    tmp[cols] <- lapply(tmp[cols], factor)
    
    tmp$통화건수 <- as.numeric(tmp$통화건수)
    
    # 데이터 병합
    ch <- rbind(ch, tmp)
  } # for 문 
  
  
  ############### 분기별 정리 #################
  date <- as.Date(as.character(ch$기준일), format = "%Y%m%d")
  lt <- unclass(as.POSIXlt(date))
  date_vector <- c("날짜", "연", "월", "일")
  ch[, date_vector ] <- with(lt, 
                             data.frame(날짜 = date
                                          , 연 = year + 1900
                                          , 월 = mon + 1
                                          , 일 = mday))
  
  # 인덱싱 
  ch <- cbind(ch[,8:9], ch[,3:6])
  
  # Quater
  ch$분기별 <- cut(ch$월, 
                br=c(0,3,6,9,12),
                labels=c("1Q","2Q","3Q","4Q"))
  
  return(ch)
  
} 
