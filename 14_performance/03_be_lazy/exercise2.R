### The following code provides an alternative implementation of rowSums(). Why is it faster for this input?

rowSums2 <- function(df) {
  out <- df[[1L]]
  if (ncol(df) == 1) return(out)

  for (i in 2:ncol(df)) {
    out <- out + df[[i]]
  }
  out
}

df <- as.data.frame(
  replicate(1e3, sample(100, 1e4, replace = TRUE))
)
system.time(rowSums(df))
#    user  system elapsed 
#   0.240   0.018   0.258
system.time(rowSums2(df))
#    user  system elapsed 
#   0.071   0.003   0.073

# rowSums converts the data frame to a matrix (ensuring all types are the same) and handles more than two dimensions.
# rowSums also handles names. For two-dimensional same-type dataframes where you don't care about names, rowSums2 will be faster.
