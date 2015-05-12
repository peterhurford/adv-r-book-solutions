### Use vapply() to compute the standard deviation of every column in a numeric data frame.

numeric_iris <- iris[-5]
vapply(numeric_iris, sd, numeric(1))

### compute the standard deviation of every numeric column in a mixed data frame. (Hint: you’ll need to use vapply() twice.)

df_sd <- function(df) vapply(df[vapply(df, is.numeric, logical(1))], sd, numeric(1))
df_sd(iris)
df_sd(mtcars)
