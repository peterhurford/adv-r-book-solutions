### What does transform() do?

# `transform` takes n arguments -- an object and n-1 further arguments
# in the form of "tag=value".  The data frame is then substituted so
# that variables specified by "tag" are created at (or replaced to be)
# "value"
#
# For example, this adds a new variable to iris that is just 3 in all positions.
transform(iris, new_var = 3)
# This cuts the Sepal.Length in half and rounds it.
transform(iris, Sepal.Length = round(Sepal.Length / 2))


### Read the documentation. How does it work?

# `transform` uses S3 dispatch, but currently is only worked for
# data.frames.  `transform.default` will attempt to convert an object
# to a data frame and then call `transform.data.frame`.


### Read the source code for transform.data.frame().
### What does substitute(list(...)) do?

# Let's test it:
sublist <- function(df, ...) {
  eval(substitute(list(...)), df, parent.frame())
}

sublist(iris, new_var = 3)
# $new_var
# [1] 3
sublist(iris, Sepal.Length = round(Sepal.Length / 2))
# $Sepal.Length
#   [1] 3 2 2 2 2 3 2 2 2 2 3 2 2 2 3 3 3 3 3 3 3 3 2 3 2 2 2 3 3 2 2 3 3 3 2 2
#  [38] 2 2 3 2 2 2 2 3 2 3 2 3 2 4 3 3 3 3 3 3 2 3 3 2 3 3 3 3 3 3 3 3 3 3 3 3
#   [75] 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2 3 3 3 3 3 3 3 3 4 3 3 4 2 4 3 4
#  [112] 3 3 3 3 3 3 4 4 3 3 3 4 3 3 4 3 3 3 4 4 4 3 3 3 4 3 3 3 3 3 3 3 3 3 3 3
#  [149] 3 3

# Clearly it captures the names and values of the transformed replacements.
#
# The first is equivalent to list(new_var = 3) and the second is equivalent to
# list(Sepal.Length = round(iris$Sepal.Length / 2)).
