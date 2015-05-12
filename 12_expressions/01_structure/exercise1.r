### There’s no existing base function that checks if an element is a valid
### component of an expression (i.e., it’s a constant, name, call, or pairlist).
### Implement one by guessing the names of the “is” functions for calls, names,
### and pairlists.

is.expressable <- function(x) {
  is.name(x) | is.call(x) | is.pairlist(x)
}
#TODO: Does not test for constants.
