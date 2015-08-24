### What does the call tree of an if statement with multiple else conditions
### look like?

pryr::ast({
  if (x == 1) { stuff() }
  else if (x == 2) { other_stuff() }
  else if (x == 3) { third_stuff() }
  else { else_stuff() }
})
## Under the hood the language will call another base `if` statement. `else if`
## seems to be for human readibility.
# \- ()
#   \- `{
#   \- ()
#     \- `if
#     \- ()
#       \- `==
#       \- `x
#       \-  1
#     \- ()
#       \- `{
#       \- ()
#         \- `stuff
#     \- ()
#       \- `if
#       \- ()
#         \- `==
#         \- `x
#         \-  2
#       \- ()
#         \- `{
#         \- ()
#           \- `other_stuff
#       \- ()
#         \- `if
#         \- ()
#           \- `==
#           \- `x
#           \-  3
#         \- ()
#           \- `{
#           \- ()
#             \- `third_stuff
#         \- ()
#           \- `{
#           \- ()
#             \- `else_stuff
