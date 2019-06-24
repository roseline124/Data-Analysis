library(readxl)
library(dplyr)

# 데이터 호출 
# http://blog.naver.com/PostView.nhn?blogId=jinhuk1313&logNo=220588893557&categoryNo=31&parentCategoryNo=0&viewDate=&currentPage=1&postListTopCurrentPage=1&from=postView
MQ <- read_excel("momq18_filtered+CLV2.xlsx")

# ==============================
# 회귀 분석 : 모델 생성
# ==============================

# 컬럼 확인
names(MQ)

# 종속, 독립 변인으로 넣을 컬럼들 선택
select.cols <- c("성별", "나이","대표아이월령", "주문매체", "CLV", "re.회원등급",
                 "MQ_date")



# 해당 컬럼만 뽑아서 데이터 프레임 생성
obj <- subset(MQ, select = select.cols)
obj <- na.omit(obj)

# 컬럼 이름 바꾸기 
# names(obj)[names(obj) == "할인후 최종결제액"] <- c("매출액")
# names(obj)

# 종속변인 ~. : 해당 컬럼만 빼고 모두 독립변인으로 분류 
# 회귀 모델 생성 / pairwise -> 데이터에 존재하는 Null 값 배제 
m <- lm(CLV~. , data = obj, use ="pairwise.complete.obs" )

# step을 통해 "매출액"에 가장 유의한 독립변수 선정
m2 <- step(m , direction = "both")

# 확인
summary(m2)






