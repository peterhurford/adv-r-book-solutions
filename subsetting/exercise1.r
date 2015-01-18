### Fix each of the following common data frame subsetting errors:

# mtcars[mtcars$cyl = 4, ]
# -->
  mtcars[mtcars$cyl == 4, ]
# = is for assignment, == is for looking for equality


# mtcars[-1:4, ]
# -->
  mtcars[-(1:4),]
# you can't mix a negative and positive index


# mtcars[mtcars$cyl <= 5]
# -->
  mtcars[mtcars$cyl <= 5, ]
# for a dataframe, you need to specify indexing for both the columns and the rows


# mtcars[mtcars$cyl == 4 | 6, ]
# -->
  mtcars[mtcars$cyl == 4 | mtcars$cyl == 6, ]
# for multiple equalities, you need to respecify the dataframe name
# (annoying, I know, but standard in computer programming -- something like `if (x = 2 || 3)` wouldn't work either.)
