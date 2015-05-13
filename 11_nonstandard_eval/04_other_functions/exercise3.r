### Add an escape hatch to plyr::mutate() by splitting it into two functions.
### One function should capture the unevaluated inputs. The other should take a
### data frame and list of expressions and perform the computation.

mutate <- function(df, ...) {
  mutate_cols(df, get_cols(df, ...))
}

get_cols <- function(...) {
  get_cols_(as.list(substitute(list(...))))
}

get_cols_ <- function(ll) {
  ll[names(ll) != ""]
}

mutate_cols <- function(df, cols) {
  for (col in names(cols)) {
    df[[col]] <- eval(cols[[col]], df, parent.frame())
  }
  df
}

df <- data.frame(x = 1:5)
identical(
  plyr::mutate(df, x2 = x * x, x3 = x2 * x),
  mutate(df, x2 = x * x, x3 = x2 * x)
)
# [1] TRUE
