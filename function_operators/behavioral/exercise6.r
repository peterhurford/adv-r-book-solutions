### Why is the remember() function inefficient? How could you implement it in more efficient way?

remember <- function() {
  memory <- list()
  f <- function(...) {
    # This is inefficient!
    memory <<- append(memory, list(...))
    invisible()
  }

  structure(f, class = "remember")
}
as.list.remember <- function(x, ...) {
  environment(x)$memory
}
print.remember <- function(x, ...) {
  cat("Remembering...\n")
  str(as.list(x))
}

## Append is inefficient because it requires recomputing the list every time it is run.  Faster would be to continue to store the number of items remembered, like so:
  f <- function(...) {
    # This is inefficient!
    number_remembers <<- number_remembers + 1
    memory[[number_remembers]] <<- list(...)
    invisible()
  }

## This is faster as shown in microbenchmark:
  ll <- as.list(seq(1000))
  number_remembers <- 1000
  microbenchmark::microbenchmark(
    { ll <<- append(ll, 2) },                                                     # 9.8mcs
    { number_remembers <<- number_remembers + 1; ll[[number_remembers]] <- 2 }    # 1.6mcs
  )
