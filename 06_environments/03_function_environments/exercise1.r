### List the four environments associated with a function. What does each one do? Why is the distinction between enclosing and binding environments particularly important?

# The four environments are:
# 1. enclosing. It is the environment where the function was created.
# 2. binding. The binding environments of a function are all environments that have a binding to it. The binding environments determine how we find the function.
#    The distincion betwee binding and enclosing environments is particularly important as it is the mechanism that R uses to provide package namespacing.
#    Example from the book:

  environment(sd)
  # <environment: namespace:stats>
  where("sd")
  # <environment: package:stats>

  x <- 1:10
  sd(x)
  # [1] 3.02765
  var <- function(x, na.rm = TRUE) 100
  sd(x)  # Still uses the same var, ignoring the one that we created in globalenv
  # [1] 3.02765

# 3. execution. This is the environment in which the function code is executed. Its parent environment is the enclosing environment.
  a <- function() {
    identical(parent.env(environment()), globalenv())
  }
  a()
  # [1] TRUE

# 4. calling. This is the environment from which the function was called. It can be accessed via parent.frame()
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
  # Called from b: [1] TRUE
  # Called from c: [1] FALSE
