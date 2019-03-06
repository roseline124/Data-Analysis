s <- strsplit("how are you?", split=" ")
s

#list[[]]
s[[1]][1]

#reverse
reversed <- s[[1]][3:1]
paste(reversed, collapse=" ")

#function
rev_word <- function(string) {
    s <- strsplit(string, split=" ")
    reversed <- s[[1]][length(s[[1]]):1]
    paste(reversed, collapse=" ")
}

rev_word("How r you?")
