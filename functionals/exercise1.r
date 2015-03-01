### Why are the following two invocations of lapply() equivalent?

trims <- c(0, 0.1, 0.2, 0.5)
x <- rcauchy(100)

lapply(trims, function(trim) mean(x, trim = trim))
lapply(trims, mean, x = x)

# The second parameter of lapply can take a name of a function found via match.fun.  Thus `lapply(trims, 'mean', x = x)` also works, even though Hadley doesn't mention that.
# lapply will then automatically apply the function from the second parameter to the first parameter.  Though, by default it will assume the first argument to lapply will be the first argument to the function unless you specify otherwise in the third argument of lapply.
# Here, mean takes three args: x, trim, and na.rm.  `lapply(trims, mean)` would do `mean(trims)` or `mean(x = trims)`.  But by specifying that `x = x`, lapply then knows that the x value for mean will be the x variable, and then passes trims as the second argument to `mean`.

