### What does the following function do? 

nl <- function(...) {
  dots <- named_dots(...)
  lapply(dots, eval, parent.frame())
}

# nl extracts the dots, names them, and then evaluates them in the global namespace.
# This returns a list of arguments that are named by what is literally in the dots,
# with the values of what the dots evaluate to.
#
# For example,
nl(1, 2 + 2, mean(c(3, 5)))
# $`1`
# [1] 1

# $`2 + 2`
# [1] 4

# $`mean(c(3, 5))`
# [1] 4


### What’s the escape hatch? 

# You can always call the underlying `lapply` directly.


### Do you think that this is an appropriate use of NSE?

# It's a toy example, I'm not really sure what you would gain from actually
# using this.
