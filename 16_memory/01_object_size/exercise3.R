### Compare the sizes of the elements in the following two lists. Each contains
### basically the same data, but one contains vectors of small strings while the
### other contains a single long string.

vec <- lapply(0:50, function(i) c("ba", rep("na", i)))
str <- lapply(vec, paste0, collapse = "")
pryr::object_size(vec)
# 13.4 kB
pryr::object_size(str)
# 8.74 kB

# The string is smaller in memory because it is a less complex representation.
