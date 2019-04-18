options(warn=-1)

df <- read.csv2("dataset/guest_house.csv", header=T)
df

# =====================================
# 빈도 분포(Frequency Distribution)
# =====================================

# 범위 : (가장 큰값 - 가장 적은 값) / 집단의 개수

table(df)
class(df$evlauation)
df$label <- ordered(df$evlauation,
                  levels = c(1, 2, 3, 4, 5),
                  labels = c("poor", "below average", "average",
                             "above average", "excellent"))

scope = ( max(df$evlauation) - min(df$evlauation)) / length(unique(df$label))
scope

df$label


table(df$label)
data.frame(table(df$label))

plot(df)

barplot(table(df$label))
pie(table(df$label))

# =====================================
# 상대 빈도
# =====================================

#Relative frequency distribution table

prop.table(table(df$label))
data.frame(prop.table(table(df$label)))
data.frame(100*(prop.table(table(df$label))))

prop.df <- prop.table(table(df$label))
barplot(prop.df)


# =====================================
# 누적 빈도 분포
# =====================================


#Cumulative frequency distribution tables
cumsum(prop.table(table(df$label)))

############### 다른 예제 : 현대차 

costs <- c(91, 78, 93, 57, 75, 52, 99, 80, 97, 62,
          71, 69, 72, 89, 66, 75, 79, 75, 72, 76,
          104, 74, 62, 68, 97, 105, 77, 65, 80, 109,
          85, 97, 88, 68, 83, 68, 71, 69, 67, 74,
          62, 82, 98, 101, 79, 105, 79, 69, 62, 73)

df <- data.frame(costs)


df$label <- ordered(df$costs,
                    levels=c(50~59,60~69,70~79,80~89,90~99,100~109))
      

# 연속형인 경우 
df$label <- cut(df$costs, breaks = c(0, 59, 69, 79, 89, 99, 109),
    labels = c('50~59', '60~69', '70~79', '80~89', '90~99', '100~109'))

df$label <- ordered(df$label)


# =================================
# 평균, 중앙값, 최빈값
# =================================

getMode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

mean(df$costs)
median(df$costs)

getMode(df$costs)

stem(df$costs)



# =================================
# 분산도 : 범위, 변량, 표준편차 
# =================================

# 범위 
range(df$costs)

scope <- max(df$costs) - min(df$costs)
scope

# 변량 
var(df$costs)

# 표준편ㅊ
sd(df$costs)


# =================================
# 사분위 구간  
# =================================


quantile(df$costs)

# Calculating IQR
sort(df$costs)

summary(df$costs)

q <- quantile(df$costs)
q

q[4] - q[2]

iqr <- IQR(df$costs)
iqr

1.5*iqr

3*iqr


# =====================================
# 추론 통계 : 표본 분포 
# =====================================

# 표본 평균의 분산 : 모분산/모집단 크기 



