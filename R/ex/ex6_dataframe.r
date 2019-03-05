name <- c('john', 'jaehee','juliet','james')
sex <- c('f', 'f','f','m')
job <- c('athlete', 'doctor','student','ceo')
age <- c('25', '35','20','37')

df <- data.frame(name, age, sex, job)
df

#slice 
df[1,] #row, column
df[,1] #row, column

#take a value
df[2,4] <- 'doctor'

#take specific label
df$name

#replace value
df[1,3] <- 'm'
df