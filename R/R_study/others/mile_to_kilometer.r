mile.to.kilo <- function(mile){
  kilo <- mile * 1.6093
  cat(mile, "mph는", kilo, "km/h", "입니다.")
  if(kilo < 80){
    cat(" 속도를 높이세요.") 
  } else if(kilo >= 80 & kilo <= 120) {
    cat(" 적정 속도입니다.")
  } else if(kilo > 120) {
    cat(" 속도를 줄이세요.")
  }
}