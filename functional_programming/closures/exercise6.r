### Create a function pick() that takes an index, i, as an argument and returns a function with an argument x that subsets x with i.

pick <- function(i) { function(x) x[[i]] }

identical(lapply(mtcars, pick(5)), lapply(mtcars, function(x) x[[5]]))
