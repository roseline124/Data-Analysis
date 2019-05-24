# https://statkclee.github.io/model/model-feature-engineering.html
#=============================
# 데이터 불러오기 
#=============================

# 예시 
# library(MASS)
# data("Boston")
# Boston[Boston$crim > 0.5, "crim"] <- NA

library(readxl)
# install.packages("caret")
suppressWarnings(suppressMessages(library(caret)))
suppressWarnings(suppressMessages(library(dplyr)))


mq <- read_excel("momq_2018.xlsx")
mq

set.seed(1000) # 500 ~ 1500 사이 값으로 초기화 

# ============================
# 결측값, 아웃라이어 확인 
# https://rpubs.com/jmhome/R_data_processing
# ============================

mq$나이 <- as.numeric(mq$나이)

mean(mq$나이, na.rm = T)  # 결측치 제외하고 math 평균 산출
# 나이 평균 : 35.62438

mq$나이 <- ifelse(is.na(mq$나이), 35, mq$나이) 

head(mq$나이, 100)

mq$re.대표아이월령 <- gsub("개월", "", mq$대표아이월령)

mq$re.대표아이월령 <- as.factor(mq$re.대표아이월령) # factor로 변환하지 않으면 multibyte 에러 발생
mq$re.대표아이월령 <- as.numeric(mq$re.대표아이월령)
mean(mq$re.대표아이월령, na.rm = T)
# 대표아이월령 평균 : 152.069

mq$re.대표아이월령 <- ifelse(is.na(mq$re.대표아이월령), 152, mq$re.대표아이월령)

table(mq$re.대표아이월령)


# plot(mq$re.대표아이월령)


















#######################
table(is.na(mq)) # 결측치 : 61388 개 

# 결측치 있는 컬럼 : 성별, 나이, 회원등급, 대표아이월령
# 종속변수 Y : 결측값을 처리할 컬럼
# 설명변수 X : Y를 추정하기 위해 필요한 단서 컬럼들 
# 1. 대표아이월령



mq <- mq %>% 
                filter(!is.na(카테고리)) %>% # &으로 연결해도 된다. 
                filter(!is.na(상위브랜드)) %>%
                filter(!is.na(브랜드))

# nrow(mq_nomiss)

names(mq)
Y <- mq$대표아이월령 
X <- mq[, c(9:11)]

model_median <- caret::train(x = X, y = Y, method = "glm", preProcess = "medianImpute")
print(min(model_median$results$RMSE))


# unique(mq$브랜드)

mq$re.대표아이월령 <- gsub("개월", "", mq$대표아이월령)
mq$re.대표아이월령 <- ifelse(is.na(mq$re.대표아이월령), "-1", mq$re.대표아이월령) 

mq$re.대표아이월령 <- as.factor(mq$re.대표아이월령) # factor로 변환하지 않으면 multibyte 에러 발생
mq$re.대표아이월령 <- as.numeric(mq$re.대표아이월령)
class(mq$re.대표아이월령)
head(mq$re.대표아이월령, 100)
head(mq$나이, 100)

names(mq)

Y <- mq$
X <- mq[,21] # re.대표아이월령 

set.seed(100)


# 중위수 대체법
# https://statkclee.github.io/ml/ml-preprocessing.html

# model <- train(x = X, y = Y, method="rf")

model_median <- caret::train(x = X, y = Y, method = "glm", preProcess = "medianImpute")

print(min(model_median$results$RMSE))

# knn 대체법 
model_knn <- caret::train(x = X, y = Y, method = "glm", preProcess = "knnImpute")

print(min(model_knn$results$RMSE))











# 아웃라이어 : 나이, 대표아이월령
# 나이
class(mq$나이)
mq$나이 <- as.numeric(mq$나이)

boxplot(mq$나이)$stats # 나이 : 23~47까지. 평균은 35. 

# 대표아이월령 : 결측값 먼저 처리할 것.
boxplot(mq$re.대표아이월령)$stats
boxplot(mq$re.대표아이월령)

class(mq$re.대표아이월령)
