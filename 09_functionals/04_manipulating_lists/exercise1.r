### Why isn’t is.na() a predicate function? What base R function is closest to being a predicate version of is.na()?

# Predicate functions return only a single TRUE or FALSE (length 1).  `is.na(x)` is vectorized and can return
# multiple TRUEs and FALSEs (length x).
# One can turn `is.na(x)` into a predicate with `any(is.na(x))`.
# is.null is a related predicate function
