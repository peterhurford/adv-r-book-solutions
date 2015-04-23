### Why does x <- 1:5; x[NA] yield five missing values? Hint: why is it different from x[NA_real_]?

# The expected behavior when subsetting by NA is to return NA for the corresponding index; e.g.
  x[c(1,NA)]
# [1]  1 NA

# With only a single NA, the index is automatically vectorized, so:
  x[NA]
# [1] NA NA NA NA NA 

# Since NA_real_ is numeric, subsetting fails and a single NA is returned.
  x[NA_real_]
# [1] NA
# (Note that this is described farther down the page.  The exercises come before the prerequisite information in the text :-/)
