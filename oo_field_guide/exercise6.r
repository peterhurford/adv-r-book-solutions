### Internal generics don't dispatch on the implicit class of base types. Carefully read ?"internal generic" to determine why the length of f and g are different in the example below. What function helps distinguish between the behaviour of f and g?

f <- function() 1
g <- function() 2
class(g) <- "function"
class(f)
# [1] "function"
class(g)
# [1] "function"

length.function <- function(x) "function"

length(f)
# [1] 1
length(g)
# [1] "function"

Hadley's point seems to be the last line of the the help page for ?"internal generic":  "For efficiency, internal dispatch only occurs on objects, that is those for which is.object returns true."  g is an object; f is not:

is.object(f)
# [1] FALSE
is.object(g)
# [1] TRUE
