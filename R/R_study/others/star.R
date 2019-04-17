### 현재 상영중인 영화중 평점이 X 점 이상인 영화이름은?###



getwd()
setwd("C:/Users/user/Downloads")
getwd()

install.packages("rvest")
install.packages("R6")

library("rvest")
library("R6")


  #영화 평점은?
  #네이버 영화페이지 크롤링  
  url = "https://movie.naver.com/movie/running/current.nhn"
  htxt <- read_html(url)
  
  # html_nodes 함수를 사용하여 info_star에 해당하는 부분을 table 변수에 저장
  table <- html_nodes(htxt,'.info_star')
  
  # html_nodes 함수를 사용하여 star_t1에 해당하는 부분을 content 변수에 저장
  content <- html_nodes(table, '.star_t1')
  
  # html_node 함수를 사용하여 num 부분을 reviews 변수에 저장
  reviews <- html_node(content, '.num')

  # html_text 함수를 사용하여 reviews 부분을 score 변수에 저장
  score <- html_text(reviews)
  
  
  #영화 이름은? 
  # html_nodes 함수를 사용하여 lst_dsc에 해당하는 부분을 table2 변수에 저장
  table2 <- html_nodes(htxt,'.lst_dsc')

  # html_node 함수를 사용하여 a에 해당하는 부분을 content2 변수에 저장
  content2 <- html_node(tablea, 'a')
  
  # html_text 함수를 사용하여 reviews 부분을 title 변수에 저장
  title <- html_text(contenta, 'a')
  title

  #함수설정
  num <- c(1:77)
  x <- numeric
  movies <- function(x){
  i <- 0
  while (i <= 77){
    i <- i+1
    if (score[i] > x) {print(title[i])}
    else {next} 
  print("입니다")
  }  
}

  #예시: 평점 9점 넘는 영화가 뭐죠?
  movies("9")
  
