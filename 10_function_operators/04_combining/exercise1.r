### Implement your own version of compose() using Reduce and %o%. For bonus points, do it without calling function.

`%o%` <- pryr::compose
compose2 <- function(...) { Reduce(`%o`, list(...)) }

#TODO: `%o%` refers to the one in the exercise or to outer (i.e., base::`%o%`)?
#TODO: How is possible to do this without calling function?
