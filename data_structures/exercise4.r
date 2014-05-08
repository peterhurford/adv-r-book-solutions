# Why is 1 == "1" true? Why is -1 < 0 true? Why is "one" < 2 false?

# Equality comparison induces type coercion. There is a order of attempted coercion:
# Comparison a logical and an integer will coerce to the latter.
# Comparison an integer and a numeric will coerce to the latter.
# Comparison a numeric and a character will coerce to the latter.

# Thus, in the worst case scenario, everything will get coerced to character.
# This should be kept in mind when dealing with functions like as.matrix.
# If you coerce a data.frame with numeric and character columns into a matrix,
# then as the matrix is homogeneously typed (every entry must be of the same type),
# the whole matrix will get converted into character.

# "one" < 2 is false because type coercion forces "one" < "2", and the inequality
# checks on character use lexicographical ordering, and "o" > "2".

