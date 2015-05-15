### You can use formals() to both get and set the arguments of a function.
### Use formals() to modify the following function so that the default value of
### x is missing and y is 10.

g <- function(x = 20, y) {
  x + y
}

formals(g)
# $x
# [1] 20
#
# $y
#

formals(g) <- alist(x =, y = 10)
formals(g)
# $x
#
#
# $y
# [1] 10

g
# function (x, y = 10)
# {
#     x + y
# }

# The fact that R can do this is very strange.
