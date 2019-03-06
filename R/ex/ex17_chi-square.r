# 카이 제곱 검정이란?
# 그룹 간에 차이가 있는지의 여부(그룹끼리 독립인지의 여부)
# == 그룹 간 비율의 차이가 있는지의 여부 
# 변수들이 있을 때, 변수들이 서로 독립이냐의 여부를 판단
# 유의미한 관계성이 있느냐.

data <- matrix(c(42,30,50,87), nrow=2, byrow=FALSE)
data

#귀무가설 : 별 차이가 없다.
#남녀 별 차이가 없을 때 예측되는 값들을 구해보자. 
#예측 값 구하기 
chisq <- function(obsrv) {
    expected <- outer(rowSums(obsrv), colSums(obsrv))/sum(obsrv)
    return(expected)
}

chisq(data)

#outer : 각 위치에 대응되는 값들을 곱한다
rs <- rowSums(data)
rs

cs <- colSums(data)
cs

outer(rs, cs) 
outer(rs, cs) / sum(data)


# 카이제곱 검증 함수 
chisq <- function(obsrv) {
    expected <- outer(rowSums(obsrv), colSums(obsrv))/sum(obsrv)
    sum((obsrv-expected)^2/expected)
}

chisq(data)

1-pchisq(9.132947, 1)

#사실 이미 존재하는 카이제곱 검증 함수
chisq.test(data)

#값이 다른 이유? Yates' continuity correction이 추가되었기 때문
chisq.test(data, correct=FALSE)