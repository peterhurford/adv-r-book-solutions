### Which base generic has the greatest number of defined methods?

library(pryr)

is.generic <- function(x) {
  is.element("generic",ftype(x))
}

# Get the list of generic functions in the base package
objs <- mget(ls("package:base"), inherits = TRUE)
base.funs <- Filter(is.function, objs)
base.generics <- Filter(is.generic, base.funs)

# Which one has the most defined methods?
num.methods <- sapply(names(base.generics),function(x) length(methods(x)))
num.methods[which.max(num.methods)]
# | 
# 2593

# The prize goes to the vectorized OR ('|'), with 19 defined methods.  Note, however, that this code produces warnings, since the methods() function takes issue with some of the generics.  For example,
  is.generic(log10)
# [1] TRUE
  methods('log10')
# no methods were found
# Warning message:
# In methods("log10") : function 'log10' appears not to be generic

# Note: To run this code you will need the pryr package, which is not available from CRAN.  It can be installed with:
library(devtools)
install_github("pryr")
