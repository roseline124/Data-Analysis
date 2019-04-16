# ==================================
# One-Way ANOVA
# ==================================
# ANOVA 패키지 'ez' : assuption 테스트 해야함. levenen 테스트까지 알아서 해준다. 
# ez : 레퍼런스 변인은 항상 팩터화 되어야 한다. 
# class()로 타입 확인 
# factor()로 팩터화 

# ezANOVA() 
# 결과$aov : 통계량 확인


# ==================================
# Within : Repeated Measure ANOVA
# ==================================

# within 아노바는 trend analysis는 해야한다.
# 시간의 경과에 따른 변화를 보고 싶을 때 trend analysis 사용 
# 트렌드를 보는 것. 선형적으로 증가하거나 감소 / 오목하게 quadratic function : 2차 함수를 보이는 패턴 변화
# cubic trend 3차원 (올라갔다 내려갔다.. 사인, 코사인함수처럼. )

# 또 다른 변인 존재 : SS_e가 2개로 나뉜다. (subject에서의)
# 한 사람이 1차, 2차, 3차를 거치면서 나타나는 variance -> grand Mean의 variance와 
# 차이가 날 수 있다. 원래는 subject Variance는 없어야 한다. 1차, 2차, 3차를 거치며
# 생기는 변화는 '술' 때문에만 생기는 변화여야 한다.
# 변화량에 대한 패턴이 존재 -> 상관관계 -> 상관관계는 높게 나와야 한다. (구형성 검증)
# 같은 사람이니까 상관관계가 높아야 한다. SS_subject 
# 전체 SS_E에서 SS_subject를 뺀다. 그러면 에러가 매우 작아진다.  

# sphericity : 흩어진 정도가 적어야 한다. 많이 흩어질 수록 상관관계는 낮아진다. 
# 2개는 구형성 검증 x
# Mauchly's test를 사용해 검증한다. 
# 구형성 검증에 위배되는 경우, 검증 power를 잃는다. 

# post-hoc -> 곤충 예제에서는 paired test 

