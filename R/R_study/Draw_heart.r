str_len <- function(string) {
  s <- unlist(strsplit(string,""))
  return(length(s))  
}

R.love.u <- function(message) {
  # deliver your message with R
  # 
  # Args:
  #   Message : (String)word of what you want to say
  dat<- data.frame(t=seq(0, 2*pi, by=0.1) )
  xhrt <- function(t) 16*sin(t)^3
  yhrt <- function(t) 12*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t)
  dat$y=yhrt(dat$t)
  dat$x=xhrt(dat$t)
  with(dat, plot(x,y, type="l"))
  with(dat, polygon(x,y, col="pink"))
  
  if (str_len(message) < 20) {
    font_size <- 2.0
  } else if(str_len(message) < 40) {
    font_size <- 1.5 
  } else {
    font_size <- 1
  }
  text(0, 0, message, adj=c(0.5,0), cex=font_size)
}

R.love.u("R Love You")
