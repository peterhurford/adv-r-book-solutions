### The function below scales a vector so it falls in the range [0, 1]. 

scale01 <- function(x) {
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}

### How would you apply it to every column of a data frame?

lapply(mtcars, scale01)
# lapply goes by column on a data frame by default.

### How would you apply it to every numeric column in a data frame?

# for a data set like iris, we get an error when applying because of the non-numeric data frames.
iris[sapply(iris, is.numeric)]  # select only numeric cols.
lapply(iris[sapply(iris, is.numeric)], scale01)  # apply a function to only the numeric cols.
