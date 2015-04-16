### What does df[is.na(df)] <- 0 do? How does it work?

# is.na() picks out those indices of df that have value NA.  The subset [ ] and assignment operations <- used together allow one to reassign the selected elements.  So, for example:
  x <- c(1,2,3,NA,5)
  x[is.na(x)] <- 0
  x
# [1] 1 2 3 0 5
# NAs are replaced with 0.
