### Use lapply() and an anonymous function to find the coefficient of variation (the standard deviation divided by the mean) for all columns in the mtcars dataset.

lapply(mtcars, function(col) sd(col) / mean(col))

## Igor
lapply(mtcars, function(x) sd(x, na.rm =T)/ mean(x, na.rm = T))
