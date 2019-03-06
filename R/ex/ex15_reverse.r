#분리하기
string <- strsplit("How are you", split=" ")
strsplit("How are you", split="")

class(string)

#합치기 
paste(string[[1]], collapse="")

#reverse
s <- strsplit("How are you", split="")
reversed <- s[[1]][11:1]
paste(reversed, collapse="")

my_reverse <- function(string) {
    s <- strsplit(string, split="")
    reversed <- s[[1]][nchar(string):1]
    paste(reversed, collapse="") 
}

my_reverse("how are you?")

#length : 변수의 개수 
#nchar : 각 문자의 개수 #다른 언어의 len, length와 같다.