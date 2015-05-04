### plyr::mutate() is similar to transform() but it applies the transformations
### sequentially so that transformation can refer to columns that were just
### created:

df <- data.frame(x = 1:5)
transform(df, x2 = x * x, x3 = x2 * x)
# Error in eval(expr, envir, enclos) : object 'x2' not found
plyr::mutate(df, x2 = x * x, x3 = x2 * x)
  # x x2  x3
# 1 1  1   1
# 2 2  4   8
# 3 3  9  27
# 4 4 16  64
# 5 5 25 125

### How does mutate work?

# Mutate iterates over the replacements in a for loop, making each replacement
# one at a time.
#
# This means that later replacements will evaluate against a data frame where
# earlier replacements have already taken place.


### What’s the key difference between mutate() and transform()?

# The presence of the for loop.
