### Why can’t an expression contain an atomic vector of length greater than one?

# Atmoic vectors of length greater than one are constructed using the function `c`,
# and functions cannot be part of expressions.


### Which one of the six types of atomic vector can’t appear in an expression? Why?

# Recall that the six types of atomic vectors are character, integer, double,
# logical, raw, and complex.

# Character
pryr::ast("a")
# \- "a"

# Integer
pryr::ast(1)
# \- 1

# Double
pryr::ast(1.0)
# \- 1
# Uh oh, looks like doubles don't work.

# Logical
pryr::ast(TRUE)
# \- TRUE

# Raw
# I think these are impossible to construct without reference to `as.raw`, so
# they won't be able to be physically typed into `pryr::ast`, since functions
# don't work in expressions.

# Complex
pryr::ast(1i)
# \-  0+1i
# Works, though note you can't type `0+1i` directly, because that will invoke
# addition.

# So it looks like doubles don't render correctly and raws are technologically
# impossible.

# TODO: Don't know why this is.
