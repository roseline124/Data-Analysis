
#결정장애를 앓고 있는 이를 위한 결.정.함.수
#Made by HYO SEON

MakeDecision <- function(INDECISION){
  x <- sample(1:100, size=1, replace=F)
  y <- x%%2
 if(y==1)(z <- "지금 당장 해 !!")
 if(y==0)(z <- "안 하는게 좋을 것 같아..")
 print(c(INDECISION, z))
}

#용례

MakeDecision("공부할까?")
MakeDecision("야식먹을까?")
MakeDecision("로또 살까?")
