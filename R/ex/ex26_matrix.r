mat <- matrix( c(1,-1,2,3), nrow=2  )
mat

det <- function(m){
    result <- m[1,1]*m[2,2] - m[1,2]*m[2,1]
    return(result)
} 

inv_mat <- function(m) {
    tmp <- m[1,1]
    m[1,1] <- m[2,2]
    m[2,2] <- tmp

    m[1,2] <- -m[1,2]
    m[2,1] <- -m[2,1]
    return(m)
}

inv <- function(m) {
    result <- (1/ (det(m)) )*inv_mat(m)
    return(result)
} 

inv(mat) == solve(mat)

inv(mat)

solve(mat)


#단위 행렬 만들기

iden <- function(n) {
    m <- matrix(0, nrow=n, ncol=n)
    
    for(i in 1:n) {
        m[i,i] <- 1 
    } #for 

    return(m)
}

i_matrix <- iden(5)
i_matrix