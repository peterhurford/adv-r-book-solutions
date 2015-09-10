### Use ast() and experimentation to figure out the three arguments in an
# if() call. Which components are required?

pryr::ast(if (1 == 1) TRUE else FALSE)
# \- ()
#   \- `if
#   \- ()
#     \- `==
#     \-  1
#     \-  1
#   \-  TRUE
#   \-  FALSE

# It looks like it takes three args -- a condition, an if-true return value,
# and an if-false return value.  This makes sense since it would be similar to
# `ifelse`.


### What are the arguments to the for() and while() calls?

pryr::ast(for (i in seq(10)) { j <- j + 1 })
# \- ()
#   \- `for
#   \- `i
#   \- ()
#     \- `seq
#     \-  10
#   \- ()
#     \- `{
#     \- ()
#       \- `<-
#       \- `j
#       \- ()
#         \- `+
#         \- `j
#         \-  1

# `for` takes three args -- a variable (e.g., `x`), an enumerated vector
# (e.g., `seq(10)`), and a block to evaluate.
pryr::ast(while(1 > 0) { print("ANNOYING") })
# \- ()
#   \- `while
#   \- ()
#     \- `>
#     \-  1
#     \-  0
#   \- ()
#     \- `{
#     \- ()
#       \- `print
#       \-  "ANNOYING"

# `while` takes two args -- a condition and a block to evaluate.
