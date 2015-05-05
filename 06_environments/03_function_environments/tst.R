  b <- function() {
    cat('Called from b: \n')
    l <- list(b = environment(),  defined_in =  parent.env(environment()), called_from = parent.frame()); print(l)
    print(identical(parent.frame(), parent.env(environment())))
    c()
  }
  c <- function() {
    cat('Called from c: \n')
    l <- list(c = environment(),  defined_in =  parent.env(environment()), called_from = parent.frame()); print(l)
    identical(parent.frame(), parent.env(environment()))
  }
  b()

