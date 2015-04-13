### Read the source code for plyr::colwise(). How does the code work? What are colwise()’s three main tasks?

`colwise` returns a function that takes a dataframe, filters it to specific columns, and then applies the function over those columns.

### How could you make colwise() simpler by implementing each task as a function operator? (Hint: think about partial().)

df_fun <- function(f) {
  force(f)
  function(df, ...) {
    stopifnot(is.data.frame(df))
    f(df, ...)
  }
}

df_filter <- function(df) {
  force(f)
  function(
#TODO: finish
