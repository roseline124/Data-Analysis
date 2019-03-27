sal <- c(~~~)

mean(sal)
sd(sal)

# two-sided = 1.96 / one-sided = 1.6..?
# z가 +- 1.96보다 크면 기각한다. 
z.test(sal, alternative="two-sided", mu, sigma.x)


# two sample : m1 - m2 
# m1 - m2 구간에 0이 있는지 확인해야 한다.
require(psych)


