#class()는 파이썬 type()과 같다. 
ordered( feature, 
         levels = c(1,2,3,4,5),
         labels = c('a','b','c','d','e')
  )

prop.table() #상태 분포
cumsum() #누적분포표 

#install.packages("COUNT")
library(COUNT)

myTable()

cut(data, seq(시작일, 마지막일, step), right=F)
cut() #br 옵션을 써서 내가 원하는 값을 벡터로 넣어 지정해줄 수 있다.
# 데이터를 어떻게 뽑은 걸까? 전화? 
# 30대는 이해가 되는데 40대는..?

# 가장 진보적인 plot library : plotly -> ggplot 베이스 
# ppt 에 embeded 가능, interactive graph 가능 
# gapminder를 사용할 수도 있다. 

# 수정할 때는 re.컬럼이름  

# error meaage : invalid graphics state : 플롯이 그려질 공간을 늘려줘야 함


#install.packages("ggplot2")
#ggplot : 레이어처럼 plot을 쌓을 수 있다. '+'로 
#geom_bar는 geometric 즉 기하학, aes 는 무엇을 보여줄 지.
#qplot()은 어디있는 거지 

#임시로 데이터를 보려면 콘솔에서 확인하면 된다. 

#3D : plotrix 패키지 
pie3D

#히스토그램 플롯 
hist()


#플롯의 한글이 깨질 때 (맥MAC 만) 아래 명령어를 맨 위에 실행시켜준다. 
par(family="폰트이름")

#산점도 
data(freeny)
names(freeny)
View(freeny)
head(freeny)
#smoothScatter() 
#plot의 col 옵션에 column 이름을 넣어주면 

boxplot() #나중에 아웃라이어도 표현해준다. 

# IQR
quantile()
IQR()

#표준편차 : sd()
#변동량 : var() 
library(outliers)
outlier()

library(psych)
describe() #집단별 기술통계치를 보여준다. 
#시계열 데이터를 보여줄 때 좋다. 




