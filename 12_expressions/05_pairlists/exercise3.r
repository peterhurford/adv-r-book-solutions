### The actual implementation of curve() looks more like

curve3 <- function(expr, xlim = c(0, 1), n = 100,
                   env = parent.frame()) {
  # Define axes with env!
  env2 <- new.env(parent = env)
  env2$x <- seq(xlim[1], xlim[2], length = n)
  y <- eval(substitute(expr), env2)

  # Plot!
  plot(env2$x, y, type = "l", 
    ylab = deparse(substitute(expr)))
}


### How does this approach differ from curve2()?

curve2 <- function(expr, xlim = c(0, 1), n = 100, 
                   env = parent.frame()) {
  f <- pryr::make_function(alist(x = ), substitute(expr), env)

  # Define axes!
  x <- seq(xlim[1], xlim[2], length = n)
  y <- f(x)

  # Plot!
  plot(x, y, type = "l", ylab = deparse(substitute(expr)))
}


# curve2 uses pryr::make_function instead of creating an env and evaluating
# within it.
