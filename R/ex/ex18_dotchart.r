x <- 1:10
y <- x-1 
plot(y-x)
dotchart(y-x)

cars <- mtcars
plot(cars$mpg)

#dotchart
dotchart(cars$mpg, row.names(cars))

#cex = font size
dotchart(cars$mpg, labels=row.names(cars), cex=0.6)

##############################
#중요!!!! 마일리지 순서대로 배열 
carmpg <- cars[order(cars$mpg), ]

#팩터화: 하나의 테이블을 각각의 요소로 분리 
carmpg$cyl <- factor(carmpg$cyl)
class(carmpg$cyl)

#컬러 추가 
carmpg$color[carmpg$cyl==4] <- "blue"
carmpg$color[carmpg$cyl==6] <- "green"
carmpg$color[carmpg$cyl==8] <- "red"

#다시
dotchart(carmpg$mpg, 
    labels=row.names(carmpg), cex=0.7,
    groups=carmpg$cyl, 
    color=carmpg$color, 
    xlab="Miles Per Gallen", 
    main="Milage Depending on Numbers of Cylinder")
