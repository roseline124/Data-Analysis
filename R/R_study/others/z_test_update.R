install.packages("BSDA")
library(BSDA)
x <- rnorm(12)


help(z.test)

z.test



x <- c(7.8, 6.6, 6.5, 7.4, 7.3, 7., 6.4, 7.1, 6.7, 7.6, 6.8)
round(sd(x),2)
round(sd(y),2)

y <- c(4.5, 5.4, 6.1, 6.1, 5.4, 5., 4.1, 5.5)
sd(y)

z.test(x, sigma.x=0.5, y, sigma.y=0.5, mu=2)



a = c(65, 78, 88, 55, 48, 95, 66, 57, 79, 81)

sd(a)
var(a)

# *******************************z.test 함수 복사 *************************************

ztest_up <- function (x, y = NULL, alternative = "two.sided", mu = 0, sigma.x = NULL, 
          sigma.y = NULL, conf.level = 0.95) {
  choices <- c("two.sided", "greater", "less")
  alt <- pmatch(alternative, choices)
  alternative <- choices[alt]
  if (length(alternative) > 1 || is.na(alternative)) 
    stop("alternative must be one \"greater\", \"less\", \"two.sided\"")
  if (!missing(mu)) 
    if (length(mu) != 1 || is.na(mu)) 
      stop("mu must be a single number")
  if (is.null(sigma.x) && !is.null(x) && is.null(y)) {
    sigma.x = round(sd(x),2)
  }
  if (!is.null(y) && is.null(sigma.y) || is.null(sigma.x)) {
    sigma.x = round(sd(x),2)
    sigma.y = round(sd(y),2)
  }
  if (!missing(conf.level)) 
    if (length(conf.level) != 1 || is.na(conf.level) || conf.level < 
        0 || conf.level > 1) 
      stop("conf.level must be a number between 0 and 1")
  if (!is.null(y)) {
    dname <- paste(deparse(substitute(x)), "and", paste(deparse(substitute(y))))
  }
  else {
    dname <- deparse(substitute(x))
  }
  nx <- length(x)
  if (nx <= 2) 
    stop("not enough x observations")
  mx <- mean(x)
  estimate <- mx
  if (is.null(y)) {
    stderr <- sigma.x/sqrt(nx)
    zobs <- (mx - mu)/stderr
    method <- c("One-sample z-Test")
    names(estimate) <- c("mean of x")
  }
  else {
    ny <- length(y)
    if (ny <= 2) 
      stop("not enough y observations")
    my <- mean(y)
    method <- c("Two-sample z-Test")
    estimate <- c(mx, my)
    names(estimate) <- c("mean of x", "mean of y")
    stderr <- sqrt(((sigma.x^2)/nx) + ((sigma.y^2)/ny))
    zobs <- (mx - my - mu)/stderr
    8
  }
  if (alternative == "less") {
    pval <- pnorm(zobs)
    cint <- c(NA, zobs * stderr + qnorm(conf.level) * stderr)
  }
  else if (alternative == "greater") {
    pval <- 1 - pnorm(zobs)
    cint <- c(zobs * stderr - qnorm(conf.level) * stderr, 
              NA)
  }
  else {
    pval <- 2 * pnorm(-abs(zobs))
    alpha <- 1 - conf.level
    cint <- c(zobs * stderr - qnorm((1 - alpha/2)) * stderr, 
              zobs * stderr + qnorm((1 - alpha/2)) * stderr)
  }
  cint <- cint + mu
  names(zobs) <- "z"
  if (!is.null(y)) 
    names(mu) <- "difference in means"
  else names(mu) <- "mean"
  attr(cint, "conf.level") <- conf.level
  rval <- list(statistic = zobs, p.value = pval, conf.int = cint, 
               estimate = estimate, null.value = mu, alternative = alternative, 
               method = method, data.name = dname)
  attr(rval, "class") <- "htest"
  return(rval)
}


x <- c(7.8, 6.6, 6.5, 7.4, 7.3, 7., 6.4, 7.1, 6.7, 7.6, 6.8)
y <- c(4.5, 5.4, 6.1, 6.1, 5.4, 5., 4.1, 5.5)

# ******************* 확인작업 *************************

z.test(x,sigma.x=1)
ztest_up(x)


z.test(x, sigma.x=0.5, y, sigma.y=0.5, mu=2)
ztest_up(x, y, mu=2)


z.test(x, sigma.x=0.5, y, sigma.y=0.5, conf.level=0.90)
ztest_up(x, y, conf.level=0.90)


library(devtools)
library(roxygen2)


참고 # https://www.popit.kr/recycled-r/


library(ztestup)
ztest_up()