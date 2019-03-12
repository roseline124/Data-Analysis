library(readxl)
students <- read_excel("BK_Lee/students.xls", na="", skip=11, col_names=FALSE)
View(students)

#인덱싱 :  View(students[1:17, c(2,4,6,7)])
data <- students[1:17, c(4,6,7)]

nrow(data)


#rename
names(data) <- c("major", "id", "name")
View(data)


#input team leaders
leaders <- readline(prompt="팀장을 입력하세요. ex) 김철수 김영희 > ")
leaders
strsplit(leaders, " ")

Sys.setlocale(category = "LC_ALL", locale = "ko_KR.UTF-8")


print(readinteger())
