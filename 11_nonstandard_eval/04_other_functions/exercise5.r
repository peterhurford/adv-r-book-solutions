### The version of subset2_q() I presented is a simplification of real code. Why is the following version better?

subset2_q_old <- function(x, condition) {
  r <- eval(condition, x, parent.frame())
  x[r, ]
}

subset2_q <- function(x, cond, env = parent.frame()) {
  r <- eval(cond, x, env)
  x[r, ]
}

# The modified version of subset2_q allows you to specify an env in which to
# evaluate the condition, which allows you to run subset2_q in more situations
# (such as within a dataframe).


### Rewrite subset2() and subscramble() to use this improved version.

subset2 <- function(x, condition, env = parent.frame()) {
  subset2_q(x, substitute(condition), env)
}

scramble <- function(x) x[sample(nrow(x)), ]

subscramble <- function(x, condition, env = parent.frame()) {
  condition <- substitute(condition, env)
  scramble(subset2_q(x, condition, env))
}
