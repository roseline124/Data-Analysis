# 종속 변인 

# delivery <- () #분 단위 

brand <- rep(c("domino", "hut"))

# cbind


# t-test 
# install.packages("nortest")

library(nortest)
hist()

# class() : 데이터 타입을 볼 수 있다. -> 캐스팅 : as.numeric 과 같이 as 활용


#정규성을 볼 때 가장 좋은 라이브러리 : qqplot
shapiro.test(pizza$de) # 샘플 사이즈가 50개 이하면 샤피로, 그 이상이면 스미노프 테스트(lillie.test())

# 등분산 검증 
library(car) #levenetest 함수 o

levene.test()

# t.test(종속변인, 독립변인, var.equal=T) #var : 변량이 같다(등분산 검증 후)
# 등분산 검증 옵션의 디폴트값은 False : 비모수 통계 welch 사용
# welch의 자유도는 '소수점'이 나온다. '사람'인데 소수점이 나온다면 비모수 통계라는 걸 알 수 있다. 
# overestimate 하게 된다. / 자유도를 눌러버린다. 

# effect size 계산하기 
# install.packages("effsize")
library(effsize) # null 가설이 받는 비판에 대한 대안 # 변인 중 effsize가 더 큰 것
cohen.d # p-value가 낮아도, effcize 가 크면 sample size를 늘려서 다시 통계 내본다. 

# n이 커질 수록 t값이 커지면서 검증력이 높아진다. 

library(car)
grubbs.test() #outlier 측정 가능 









