#clean data ^0^
# install.packages("tidyr") 
library(tidyr)
library(dplyr)

member <- data.frame(
    family=c(1,2,3), namef=c("a","b","c"),
    agef=c(30,40,23), namem=c("d","e","f"),
    agem=c(44,53,25)
)

#not group by gender 
member

#tidyr library
#key : value = namef~agem : values
a <- gather(member, key, value, namef:agem)
b <- separate(a, key, c("variable", "type"), -1)
new <- spread(b, variable, value)

filter(new, type=="f")
filter(new, age>=30)

select(member, family, namef, agef)

#pipe line : all in one!
member %>%
    gather(key,value,namef:agem) %>%
    separate(key, c("variable", "type"), -1) %>%
    spread(variable, value)
