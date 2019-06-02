## Correspondence Analysis
install.packages("ca")
library(ca)
smoke <- data.frame(smoke) #frequencies of smoking habits (none, light, medium and heavy) 
#for staff groups (senior managers, junior managers, senior employees, junior employees and secretaries) in a fictional company.
str(smoke)
fit <- ca(smoke)
print(fit) # basic results 
summary(fit) # extended results 
plot(fit) # symmetric map
plot(ca(smoke, supcol = 1))
plot(fit, mass = TRUE, contrib = "absolute", map = "rowgreen", arrows = c(FALSE, TRUE)) # asymmetric map
plot3d.ca(ca(smoke, nd=3))
plot3d.ca(fit)

#### Brand Positioning Example by Correspondence Analysis
fashion.brand <- read.table("~/Google Drive/furious lion/king/R Book/correspondence analysis/brand.txt")
fashion.brand
fit2 <- ca(fashion.brand)
print(fit2) # basic results 
summary(fit2) # extended results 
plot(fit2) # symmetric map
plot(ca(fashion.brand))
plot(fit2, mass = TRUE, contrib = "absolute", map = "rowgreen", arrows = c(FALSE, TRUE)) # asymmetric map
plot3d.ca(ca(fashion.brand, nd=4), col = c("#6666FF","#FF6666"))
plot3d.ca(fit2)

###Multiple and joint correspondence analysis
data("wg93")
wg93
names(wg93)
wg93$BMW <- ordered(wg93$A,
                    levels = c(1, 2, 3, 4, 5),
                    labels = c("strongly like", "somewhat like", "neutral", "somewhat dislike", "strongly dislike"))
wg93$Lexus <- ordered(wg93$B,
                      levels = c(1, 2, 3, 4, 5),
                      labels = c("strongly like", "somewhat like", "neutral", "somewhat dislike", "strongly dislike"))
wg93$Benz <- ordered(wg93$C,
                     levels = c(1, 2, 3, 4, 5),
                     labels = c("strongly like", "somewhat like", "neutral", "somewhat dislike", "strongly dislike"))
wg93$AUDI <- ordered(wg93$D,
                     levels = c(1, 2, 3, 4, 5),
                     labels = c("strongly like", "somewhat like", "neutral", "somewhat dislike", "strongly dislike"))

wg93$age <- ordered(wg93$age,
                    levels = c(1, 2, 3, 4, 5, 6),
                    labels = c("10th", "20th", "30th", "40th", "50th", "60th"))

wg93$sex <- ordered(wg93$sex,
                    levels = c(1, 2),
                    labels = c("male", "female"))

wg93$edu <- ordered(wg93$edu,
                    levels = c(1, 2, 3, 4, 5, 6),
                    labels = c("elementary", "middle school", "high school", "college", "university", "graduate"))

names(wg93)

mjca(wg93[,5:11])
summary(mjca(wg93[,5:11], lambda = "JCA"))
plot(mjca(wg93[,5:11]))
fit3 <- mjca(wg93[,5:11])
plot(fit3, mass = TRUE, contrib = "absolute", map = "rowgreen", arrows = c(FALSE, TRUE))

