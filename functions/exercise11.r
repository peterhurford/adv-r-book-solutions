### Create an infix xor() operator.

  `%xor%` <- function(a,b) (a | b) & !(a&b)
 
  T %xor% T
# [1] FALSE
  T %xor% F
# [1] TRUE
  F %xor% T
# [1] TRUE
  F %xor% F
# [1] FALSE
