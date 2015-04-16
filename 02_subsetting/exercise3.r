### What does upper.tri() return? How does subsetting a matrix with it work? Do we need any additional subsetting rules to describe its behaviour?
### x <- outer(1:5, 1:5, FUN = "*")
### x[upper.tri(x)]

# Note that x is a matrix:
  x
#     [,1] [,2] [,3] [,4] [,5]
# [1,]    1    2    3    4    5
# [2,]    2    4    6    8   10
# [3,]    3    6    9   12   15
# [4,]    4    8   12   16   20
# [5,]    5   10   15   20   25

# upper.tri() returns a logical matrix indicating the upper triangle of the matrix.
  upper.tri(x)
#      [,1]  [,2]  [,3]  [,4]  [,5]
# [1,] FALSE  TRUE  TRUE  TRUE  TRUE
# [2,] FALSE FALSE  TRUE  TRUE  TRUE
# [3,] FALSE FALSE FALSE  TRUE  TRUE
# [4,] FALSE FALSE FALSE FALSE  TRUE
# [5,] FALSE FALSE FALSE FALSE FALSE

# Subsetting with [ ] returns an object of the lowest possible dimensionality, in this case a vector:
  x[upper.tri(x)]
# [1]  2  3  6  4  8 12  5 10 15 20
