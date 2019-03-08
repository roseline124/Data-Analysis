# if() {}
# else if {}
# else 
#많이 쓰니 외울 것 : which(mtcars$cyl==4) #실린더가 4인 것들
mtcars
aggregate(mtcars$mpg, by=list(mtcars$cyl), mean)

mean_by_cyl <- function(x) {
    if(x==4) {
        # which(mtcars$cyl==4) #실린더가 4인 것들의 행 인덱스를 보여줌
        # mtcars[which(mtcars$cyl==4),] #실제 값을 보여준다.
        # mtcars[which(mtcars$cyl==4),][,1] #첫번째 열만 가져온다.
        mean(mtcars[which(mtcars$cyl==4),]) #return 이 없더라도 변수에 담긴 게 아니라면 반환한다. 
    } else if(x==6) {

    } else if(x==8) {

    } else {
        print("Wrong Number")
    }
}

#더 쉽게 표현하기 
mean_by_cyl2 <- function(x) {
    mean(mtcars[which(mtcars$cyl==x),][,1])
}