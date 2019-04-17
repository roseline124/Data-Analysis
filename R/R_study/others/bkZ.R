# BK's first function for z-test

bk.z <- function (x, y) {
   require(psych)
    a= describeBy(x, y)
    names(a)=c("Descriptive Statistics")
    b=c((mean(x[y==1], na.rm=T)- mean(x[y==2], na.rm=T))
      /sqrt(var(x[y==1], na.rm=T)/length(x[y==1]) + var(x[y==2], na.rm=T)
            /length(x[y==2]))) 
  names(b)=c("z-Score")
  c=c((mean(x[y==1], na.rm=T)- mean(x[y==2], na.rm=T))
      - 1.96 * sqrt(var(x[y==1], na.rm=T)/length(x[y==1]) + var(x[y==2], na.rm=T)
                    /length(x[y==2])), (mean(x[y==1], na.rm=T)- mean(x[y==2], na.rm=T))
      + 1.96 * sqrt(var(x[y==1], na.rm=T)/length(x[y==1]) + var(x[y==2], na.rm=T)
                    /length(x[y==2])))
  names(c)=c("low bound 95% CI","high bound 95% CI")
  print(a)
  print(b)
  print(c)
}


