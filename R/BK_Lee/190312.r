#working directory 설정 
setwd("C:/Users/guseo/data_analysis/R/BK_Lee")

#함수의 '함'은 상자의 함이다. ㅇ0ㅇ
hello() <- function()  {
    print("hello")
}

#패키지 설치 : install.packages("패키지 이름")
install.packages("Zelig") #업데이트가 자주되는 패키지 

#library import하기
#require 와의 차이는? 라이브러리는 function() {}안에서 사용된다. 패키지가 없어도 계속 실행하며, 경고를 준다.
#library는 에러가 난다.
#https://stackoverflow.com/questions/5595512/what-is-the-difference-between-require-and-library
#CRAN : 저장소에서 받는 법 / Archive 에서 받는 법 2가지가 있다. (이건 물론 컴퓨터가 하는 영역)
library(Zelig) 

#help
??psych #패키지가 궁금할 때
?lm # 함수가 궁금할때 

#R은 Ram 베이스기 때문에 껐다 다시 키면 library를 다시 import해야 한다. 
library(Zelig)

#random sampling
# [1] : bracket의 의미는 뭘까? 값의 위치를 나타낸다.  
rnorm(20) 

#이게 모야?
getOption("digits")


#변이를 나타낼 때 <- 로 나타낸다. 벡터, 행렬 등 값을 할당할 때 쓴다. 
#equal은 변이를 나타낼 때 쓰지 않는다. 
x <- 2 # vector : N by 1 매트릭스를 벡터라고 한다. 세로로 1열 

#언더바 대신에 .을 쓴다. 
my.data 

joohwan <- c(2,3,4,5)
joohwan

#세미콜론을 쓰면 한 줄에 여러 명령어를 실행할 수 있다. 
x; x+x; 

#벡터 할당

weight <- c(60, 72, 57, 90, 95, 72)
height <- c(1.75, 1.80, 1.65, 1.9, 1.74, 1.91 )

BMI = weight/height**2

#22에서 25 사이가 정상 
BMI

#산술평균
sum(weight)

#편차 구하기 

#source : 내가 만든 라이브러리를 부럴로 올 떄 쓰낟. 

#custom 함수 
batman <- function(v) {

    a <- mean(v)
    names(a) = "batman's function"
    return(a)
}

batman(c(1,2,3,4,5))

#논리 벡터 

v <- c("T", T, F, F)
v

#cat() : character의 따옴표를 없애준다.

cat(c("1","2"))

x<-c(red="Apple", purple="Grapes")

#names() : 데이터에 어떤 변인이 있는지 확인한다. / str() : structure
names(x)

#seq() : 수열을 만들 때 사용한다. 
seq(4, 100) == 4:100
seq(4, 100, 5) #3번째 인자는 step(간격)

#rep() : 반복 
rep(c(1,2,3), 2)
rep(c(1,2,3), 1:5)
rep(c(1,2,3), c(10,15))

#matrix 
matrix(1:12, nrow=3, byrow=T) #행쪽으로 
matrix(1:12, nrow=3, byrow=F) #열쪽으로 

#열과 행 바꾸기 : t()

#역행렬 : inverse() / 5의 역수 : 1/5

x <- matrix(1:9, nrow=3, byrow=T)
x

#가역행렬이어야 solve할 수 있다. '대칭행렬'이어야 한다.
det(x) #determinant가 0이 되어서는 안된다. e-16 : 0이 16개 

solve(x)

#행렬 대수를 배우자. 
students=1:250;
rand_students=sample(students,length(students));
rand_students


# <범주형 변수> 
#과학의 목적은 '현상을 관찰'하는 것 / 사회과학은 '사회 현상을 관찰한다' / 그리고 이 현상을 설명한다.
#그리고 예측한다. 
#현상을 관찰하기 위해서 '측정(scale)'해야한다. 
#측정의 4가지 수준 :
# - ratio : 남녀라도 F, M으로 쓰지 않고 1, 0으로 표시한다. 
# - 등간척도 (interval) : interval scale부터 평균을 구할 수 있다. 평균을 구할 수 있으니 표준 편차를 구할 수 있다.  
# - 서열척도 (order) : 초등, 중등, 고등 
# - 명목척도 (norm)

att <- c(1,4,2,2,4)

#factor : norminal scale로 바꿔준다. 
fatt <- factor(att, levels=1:5)
fatt
class(fatt)

as.numeric(fatt)
class(fatt)

#dataframe 

id <- seq(1:18)
id

year <- seq(2016, 1948, -4)
year

df <- data.frame(id, year)
head(df)
tail(df)
names(df)
str(df)

df$year
dataset.height$year 

#indexing ★★★★★
year[c(1,3,5)] #1, 3, 5번 째
year[-c(1,3,5)] #1, 3, 5번 째를 빼고 

year[1:5]


#조건적 선택 
df['year' > 1996]
df['year' > 1996,]

#df 인덱싱 
df[2, 2] #row : case, column : 변인
df[,1]


#루프 : 반복문 
lappy #리스트 반환
sapply #결과를 벡터 또는 행렬로 단순화한다. 
tapply #테이블에 각각 함수를 적용한다. 

lappy(df, mean) # 열 별로 평균을 보여준다. 


#새로운 변인 

presidents
str(presidents)
View(presidents)


#종속변인$독립변인 포맷으로 쓴다. 

sart()
order(rand_students)


#파일 불러오기 : csv(comma seperated variables), db, sps, txt, xlsx 
file_csv = read.csv("../dataset/nba2013.csv", header=FALSE)
file_csv

library(readxl)
#엑셀에서 특정 시트 지정하기 
read_excel("../dataset/DA.xlsx", sheet="")

#spss를 불러오는 가장 안정적인 패키지 : foreign
read.spss()


#위에서쓴 working directory를 지정하는 함수를 쓰면 파일 경로를 일일이 적어주지 않아도 된다. 
attach(dataframe) #attach를 쓰면 df$column과 같이 안써도 바로 column으로 써도 된다. 그러나 메모리에 올려놓는 것이기때문에 데이터가 큰 경우 attach는 안쓰는게 좋다. 
detach(dataframe) 


#data handling : recode (재코딩)

names(df)[1] <- "번호"
colnames(df)[2:4] <- c("인구", "소득", "변화")

library(gdata)
rename.vars()

#제일 중요한 것 : 원본 데이터를 보관하는 것 / 원본 데이터에서 필요한 컬럼만 뽑아내는 것(서브셋팅)

df['year']

data.frame(df["density"])
df['year']

names(df)

df["year"]

df[2]

df[1:2]
front <- data.frame(df[2], df[1:2])
front

#re.컬럼이름 : 해당 컬럼을 recoding했다는 것을 알려주는 관례

#reverse code : 성의없이 답변하는 설문답변을 잡아내기 위해 쓴 질문 (일부로 점수를 반대로 바꿔놓음) 
recode(x, '1-5; 2=4; 3-3; 4=2; 5=1;')

library(car)


# %in% c(1,3)

#subsetting

subset(st, df.illiteracy == 1 $ df.density == "low.density")

#구 교수님 

getOption('width') 
getOption('repos') 

#R에서 정의된 옵션을 보여준다.