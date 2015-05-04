### The following R functions all use NSE. For each, describe how it uses NSE,
### and read the documentation to determine its escape hatch.

### rm()

# `rm` uses `match.call`.  But you can use the `list` argument to provide character
# (or programatic) names to remove.

x <- 2
y <- 'x'
z <- 'x'
rm(z)  # Removes z, but x and y still exist
rm(list = y)  # Removes x, but y still exists
y
# [1] "x"


### library() and require()

# They both `substitute` to get the literal package name, presumably this is used
# for safety to prevent malicious installs.
#
# The escape hatch here is to call `library` or `require` with `character.only = TRUE`,
# which will allow the use of character (programatic) names.


### substitute()

# Of course, substitute, the king of NSE, uses NSE, though because it is a
# primitive, it's going to be unclear precisely what goes on.
#
# I don't think any "escape hatch" can be used to turn off the NSE of substitute.


### data()

# Data acts like `library`, but escapes NSE like `rm` (i.e., a `list` arg can
# be passed).


### data.frame()

# `data.frame` uses `as.list(substitute(list(...)))` to gather row names from
# what is passed.  However, the `row.names` argument can be used to set character
# (or programatic) row names.
