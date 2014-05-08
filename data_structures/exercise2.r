# What makes is.vector() and is.numeric() fundamentally different to is.list() and is.character()?

# Both atomic and recursive types are vectors (an example of one that is not is, e.g., an S4 class or a function).
# Thus, is.vector(c(1,2)) is TRUE whereas is.list(c(1,2)) is FALSE.

# is.numeric checks for whether the type is numeric whereas is.character checks for whether the type is character
