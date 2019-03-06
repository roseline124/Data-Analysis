#ggplot과 함께 많이 쓰이는 그래프 패키지 
#install.packages("ggvis")
library(ggvis)

#mtcars$mpg라고 하지 않아도 알아서 찾는다. 상대경로 같은 느낌
attach(mtcars) 
plot(mpg, wt)

#데이터 종류가 많아지면 attach는 오류가 생길 수 있으니
#파이프라인을 쓰자.

mtcars %>% 
    # numeric : 연속적인 값이기 때문에 그라데이션이 나온다.
    # ggvis( ~mpg, ~wt,  fill:="red") %>% # ~ : 변수이다.
    ggvis( ~mpg, ~wt,  fill=~cyl) %>% # ~ : 변수이다.
    # layer_lines()
    # layer_bars()
    layer_points() %>%
    layer_smooths()

#numeric이 아니라 딱딱 떨어지는 값으로 하면?
mtcars$cyl <- factor(mtcars$cyl)

mtcars %>% 
    ggvis( ~mpg, ~wt,  fill=~cyl) %>% # ~ : 변수이다.
    layer_points() %>%
    layer_smooths() %>%
    add_axis("x", title="MPG", values=c(10:35)) %>% #데이터 쪼개기 
    add_axis("y", title="WT", subdivide=4) #subdivide : 눈금
