### What does replicate() do?

# Replicate runs a certain expression multiple times.

### What sort of for loop does it eliminate?

# It eliminates a loop over the number of times you want to run the expression.

### Why do its arguments differ from lapply() and friends?

# Because it isn't applying an expression to a number of inputs, but rather running an expression a number of times.

# Note that lapply() can be used to mimic the behavior of replicate(), but rarely vice versa.
# Thus, these two lines of code do the same thing:

replicate(3, runif(5), simplify = FALSE)
lapply(1:3, function(x) runif(5))
