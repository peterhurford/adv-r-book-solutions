### Why is the default missing value, NA, a logical vector? What’s special about logical vectors? (Hint: think about c(FALSE, NA_character_).

# The hint is important, as `c(FALSE, NA_character)` results in `c("FALSE", NA)`.
# This means that the answer has to be about coercion.
#
# Recall that in R there is a heirarchy of recursion that goes logical -> integer
# -> double -> character.  If `NA` were, for example, a character, including `NA` in
# a set with integers or logicals would result in them getting coerced to characters
# which would be undesirable.  Making `NA` a logical means that involving an `NA`
# in a dataset (which happens often) will not result in coercion.
