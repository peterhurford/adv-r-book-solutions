### Sometimes it’s necessary to uncover the function that called the function
### that called the current function (i.e., the grandparent, not the parent).
### How can you use sys.call() or match.call() to find this function?

child_fn <- function(x) {
  message("I am the child fn.")
  message("My parent is ", sys.call(-1))
  message("My grandparent is ", sys.call(-2))
  x
}

daddy_fn <- function(x) {
  message("I am the daddy fn.")
  message("My parent is ", sys.call(-1))
  child_fn(x)
}

grandpa_fn <- function(x) {
  message("I am the grandpa fn.")
  daddy_fn(x)
}

grandpa_fn(5)
# I am the grandpa fn.
# I am the daddy fn.
# My parent is grandpa_fn5
# I am the child fn.
# My parent is daddy_fnx
# My grandparent is grandpa_fn5
# [1] 5
