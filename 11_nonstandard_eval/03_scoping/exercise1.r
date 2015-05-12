### plyr::arrange() works similarly to subset(), but instead of selecting rows,
### it reorders them. How does it work? What does substitute(order(...)) do?
### Create a function that does only that and experiment with it.

ord <- function(df, ...) {
  eval(substitute(order(...)), df, parent.frame())
}

ord(mtcars, cyl, disp)
# [1] 20 19 18 26 28  3 21 27 32  9  8 30  1  2 10 11  6
#  4 12 13 14 31 23 22 24
# [26] 29  5  7 25 17 16 15

# `order` returns the indices neede to rearrange a list into the order specified
# by the arguments passed to order.  `substitute(order(...)), df)` will evaluate
# the passed arguments within df.  That is, `substitute(order(cyl, disp), df)` is
# equivalent to `order(mtcars$cyl, mtcars$disp)`.
#
# `parent.frame` is then passed as an enclosing environment for variables that
# are used to subset but are not within data frame -- R will instead look in the
# parent environment.
