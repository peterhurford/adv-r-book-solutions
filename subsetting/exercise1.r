### Fix each of the following common data frame subsetting errors:

# mtcars[mtcars$cyl = 4, ]
# -->
# mtcars[mtcars$cyl == 4, ]

# mtcars[-1:4, ]
# -->
# mtcars[-(1:4),]

# mtcars[mtcars$cyl <= 5]
# -->
# mtcars[mtcars$cyl <= 5, ]

# mtcars[mtcars$cyl == 4 | 6, ]
# -->
# mtcars[mtcars$cyl == 4 || mtcars$cyl == 6, ]

