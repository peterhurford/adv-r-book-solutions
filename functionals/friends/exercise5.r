### Implement a version of lapply() that supplies FUN with both the name and the value of each component.

lapply2 <- function(X, FUN, ...) {
    out <- vector("list", length(X))
    for (i in seq_along(X)) {
      out[[i]] <- FUN(c(names(X)[[i]] = X[[i]]), ...)
    }
    out
  }
}
## name elements in the list
lapply2 <- function(X, f, names,  ...) {
    stopifnot(length(X) == length(names))
    out <- vector("list", length(X))
    for (i in seq_along(X)) {
      out[[i]] <- f(X[[i]], ...) 
      names(out)[i] <- names[i] 
    }
    out
  }
}
