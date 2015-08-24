### Compare ast(x + y %+% z) to ast(x ^ y %+% z). What do they tell you about
### the precedence of custom infix functions?

pryr::ast(x + y %+% z)

# \- ()
#   \- `+
#   \- `x
#   \- ()
#     \- `%+%
#     \- `y
#     \- `z

# or, `+`(x, `%+%`(y, z))
# `%+%` has higher precedence.

pryr::ast(x ^ y %+% z)
# \- ()
#   \- `%+%
#   \- ()
#     \- `^
#     \- `x
#     \- `y
#   \- `z

# or `%+%`(`^`(x, y), z)
# `^` has higher precedence.

# Custom infix functions must be between addition and exponentiation in precedence.
#TODO: Curious why this is.
