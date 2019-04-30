state.x77
library(PerformanceAnalytics) # 상관관계를 한눈에 볼 수 있다.

#bivariance : cor.test()
# option : method / use = 결측 데이터 pairwise, complete.obs(listwise라고 한다)

#listwise : 결측값이 난 데이터의 row는 제거 
#pairwise : 두 컬럼을 비교할 때만 각 컬럼 내에 있는 결측값만 제거하고 다른 
#            컬럼은 내버려둔다. missing이 많은 경우 pairwise로 하고, 
# 그 외는 listwise를 사용 

# mean inputation : 결측값을 뺀 나머지 데이터로 평균을 내서 결측 데이터에 채운다.
# nears neigborhood inputation : 주변에 가까운 데이터로 채운다.
# 아멜리아 패키지 
# multiple inputation : 결측값에 들어갈 데이터가 한 두개가 아닐 것임을 가정. 
# missing(오류) : random error(확률 오차는 찾아낼 수 있다.), system error(잘못 실험하거나....)

# pearson : 계수 : r
# spearman : rank data / 계수 : rho (ρ)

#sjPlot 패키지 
#sjp.corr() # 히트맵 그리기 


#############################

# ols는 lm()을 쓴다.
# regression을 할 때는 fit이라는 변수 이름을 많이 쓴다. 
# confint(fit) : f값, r^2값 확인 
# 각 변인들은 단위가 달라서 각 변인 간의 상관관계를 밝힐 수 없다. 따라서
# 각 계수들을 표준화해야 한다. standardized coefficient 
# lm.beta()를 쓰면 알아서 estimate(unstandardized)과 standardized 값을 비교할 수 있다. 

#############################

# dummy variable regression 
# 카테고리 변인은 어떻게 해야할까? ex. 브랜드, 성별 등 
# 더미 변인(가변인)으로 바꿔야 한다. ex. 남자는 0, 여자는 1 
library(car) # norminal 변인을 넣어도 알아서 분석해준다. 
# 준거집단 referenced data는 lm.beta() 분석 결과에 나오지 않는다.
# prof직업군이 bluecolor직업보다 상대적으로 ~하다.고 해석한다.




# 유용한 regression 
# hierarchical regression(위계적 회귀분석)을 많이 사용한다. 
# 변인군의 R스퀘어를 찾고자 할 때. 
# 유사한 변인들끼리 묶어서 regression 

# 변인 4개가 있으면 4개의 model을 만든다. (full model하고 나머지 3개 )

# R스퀘어값들을 anova()로 하면? 

# predict() 함수로 예측할 수 있다. 

# diagnostic plot()으로 아웃라이어, influence를 확인한다. 


#vif() 다중 공선성 : 10이 넘어가면 문제가 있다. 
# 10이 넘어가면 그 변인은 제거해야 한다. 
# 두 변인의 상관계수가 높을 수록 같은 변인일 가능성이 높다. 


# 팀명, 팀리더, 금요일날 올라오는 데이터로 시나리오를 그려본다. 
# 조별로 게임(레크리에이션) 하기 


