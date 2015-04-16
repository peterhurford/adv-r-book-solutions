### Why do you need to use unlist() to convert a list to an atomic vector? Why doesn’t as.vector() work?

# Recall that lists are considered vectors, so `as.vector` will leave it the same.

# However, `as.vector` can be used to convert a non-recursive list to an atomic vector
# if the desired `mode` is passed explicitly.

# But the core problem is that `as.vector` cannot handle recursion within lists.  Only `unlist` can do that.
