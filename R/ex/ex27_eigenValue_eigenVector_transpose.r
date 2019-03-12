# 행렬 A를 선형변환 A에 의한 변환 결과에서 
# 자기 자신의 상수배가 되는 0이 아닌 벡터를 고유 벡터, 
# 자기 자신의 상수배인 값을 고유값이라고 한다.

a <- matrix( c(1,3,4,7,3,2,4,7,9), nrow=3 )
a

#eigen values
ev <- eigen(A)$values
ev

#eigen vectors
evec <- eigen(A)$vectors
evec


#symmetric matrix : 직교 행렬
C <- matrix( c(3,2,-2,2,1,-2,-2,-2,1), nrow=3, ncol=3 )
C

#transpose 
trans <- function(A) {

    B <- A

    for(i in 1:nrow(A)){
        for(j in 1:ncol(A)) {
            B[j,i] <- A[i,j] 
        }
    }

    return(B)
}

C==trans(C)

