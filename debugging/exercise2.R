### The goal of the col_means() function defined below is to compute the means of all numeric columns in a data frame.

col_means <- function(df) {
  numeric <- sapply(df, is.numeric)
  numeric_cols <- df[, numeric]
  data.frame(lapply(numeric_cols, mean))
}

### However, the function is not robust to unusual inputs. Look at the following results, decide which ones are incorrect, and modify col_means() to be more robust. (Hint: there are two function calls in col_means() that are particularly prone to problems.)

col_means(mtcars)
col_means_(mtcars)
# Works great!

col_means(mtcars[, 0])
# Error in .subset(x, j) : invalid subscript type 'list'
# mtcars[, 0] resolves to an empty dataframe.  Let's early return NA and warn if this happens.
col_means_(mtcars[, 0])
# [1] NA
# Warning message:
# In col_means_(mtcars[, 0]) : Dataframe is empty, no means to calculate.

col_means(mtcars[0, ])
#  mpg cyl disp  hp drat  wt qsec  vs  am gear carb
# 1 NaN NaN  NaN NaN  NaN NaN  NaN NaN NaN  NaN  NaN
# mtcars[0, ] resolves to a 0-row dataframe.  Let's early return NA and warn if this happens.
col_means_(mtcars[0, ])
# [1] NA
# Warning message:
# In col_means_(mtcars[0, ]) : Dataframe is empty, no means to calculate.

col_means(mtcars[, "mpg", drop = F])
  # X21 X21.1 X22.8 X21.4 X18.7 X18.1 X14.3 X24.4 X22.8.1 X19.2 X17.8 X16.4 X17.3 X15.2 X10.4 X10.4.1 X14.7 X32.4 X30.4 X33.9 X21.5 X15.5 X15.2.1 X13.3 X19.2.1 X27.3 X26 X30.4.1
# 1  21    21  22.8  21.4  18.7  18.1  14.3  24.4    22.8  19.2  17.8  16.4  17.3  15.2  10.4    10.4  14.7  32.4  30.4  33.9  21.5  15.5    15.2  13.3    19.2  27.3  26    30.4
  # X15.8 X19.7 X15 X21.4.1
# 1  15.8  19.7  15    21.4
# Only one column, so we're getting weird row output instead of column based output.  Ideally we want the mean of just this row.
# This comes from `numeric_cols <- df[, numeric]` in the function.  We need `drop = FALSE` 
col_means_(mtcars[, "mpg", drop = F])

col_means(1:10)
# Error in df[, numeric] : incorrect number of dimensions
col_means(as.matrix(mtcars))
# Error in df[, numeric] : (subscript) logical subscript too long
col_means(as.list(mtcars))
# Error in df[, numeric] : incorrect number of dimensions
# Col_means is only meant to be on a data.frame.  Let's validate that.
col_means_(1:10)
# Error in col_means_(1:10) : Input must be a data frame
col_means_(as.matrix(mtcars))
# Error in col_means_(as.matrix(mtcars)) : Input must be a data frame
col_means_(as.list(mtcars))
# Error in col_means_(as.list(mtcars)) : Input must be a data frame

mtcars2 <- mtcars
mtcars2[-1] <- lapply(mtcars2[-1], as.character)
col_means(mtcars2)
# This returns one row again, because all but the first row is converted to character, and characters are dropped.
# col_means_ already can handle this, due to our `drop = FALSE` modification earlier.
# However, we probably should warn the user what happened.
col_means_(mtcars2)
#        mpg
# 1 20.09062
# Warning message:
# In col_means_(mtcars2) : Dropped 10 non-numeric columns.

# col_means_ defined here (after iterating through all the examples)
col_means_ <- function(df) {
  if (!is.data.frame(df)) stop("Input must be a data frame")
  if (0 %in% dim(df)) {
    warning("Dataframe is empty, no means to calculate.")
    return(NA)
  }
  numeric <- sapply(df, is.numeric)
  if (FALSE %in% numeric) warning("Dropped ", sum(!numeric), " non-numeric columns.")
  numeric_cols <- df[, numeric, drop = FALSE]
  data.frame(lapply(numeric_cols, mean))
}
