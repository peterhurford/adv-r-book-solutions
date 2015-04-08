### What does as.matrix() do when applied to a data frame with columns of different types?

# Recall that matrices are atomic (cannot have different types).  Therefore we would expect recursion.

> as.matrix(data.frame(a = 1, b = 'char'))
     a   b
[1,] "1" "char"
