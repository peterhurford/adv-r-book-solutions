# How would you describe the following three objects? What makes them different to 1:5?
x <- 1:5
x1 <- array(1:5, c(1, 1, 5))
x2 <- array(1:5, c(1, 5, 1))
x3 <- array(1:5, c(5, 1, 1))

# All three of these arrays are different from 1:5 in that they are arrays, whereas 1:5 is not (it's a vector).
# Furthermore, x1, x2, and x3 are arrays with different dimensions: x1 is a 1x1x5 matrix, x2 is 1x5x1, and
# x3 is 5x1x1.  This will make the interact differently with array operations.

# For example:
dim(x) # NULL (x doesn't accept array operations because it isn't an array)
dim(x1) # [1] 1 1 5
dim(x2) # [1] 1 5 1
dim(x3) # [1] 1 1 5