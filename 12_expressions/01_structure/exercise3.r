### What does the call tree of an if statement with multiple else conditions
### look like?

pryr::ast({
  if (x == 1) { stuff() }
  else if (x == 2) { other_stuff() }
  else if (x == 3) { third_stuff() }
  else { else_stuff() }
})

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
