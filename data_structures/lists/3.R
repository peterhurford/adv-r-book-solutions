# Test your knowledge of vector coercion rules by predicting the output of the following uses of c():

# The result will be atomic if and only if all of its components are atomic.
# Otherwise, it will be a list.

# > c(1,FALSE)
# [1] 1 0
# > c("a", 1)
# [1] "a" "1"
# > c(list(1), "a")
# [[1]]
# [1] 1
# 
# [[2]]
# [1] "a"
# 
# > c(TRUE, 1L)
# [1] 1 1

