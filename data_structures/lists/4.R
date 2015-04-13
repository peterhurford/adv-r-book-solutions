### Why do you need to use unlist() to convert a list to an atomic vector? Why doesn’t as.vector() work?

# `as.vector` can be used to convert a non-recursive list to an atomic vector
# if the desired `mode` is passed explicitly.  However, `as.vector` cannot handle
# recursion within lists.  Only `unlist` can do that.
