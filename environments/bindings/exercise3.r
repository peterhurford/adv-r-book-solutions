### Write an assignment function that can do active, delayed, and locked bindings. What might you call it? What arguments should it take? Can you guess which sort of assignment it should do based on the input?

#' Assignment, but with special features.
#' @param name character. A string with the name of the variable to assign.
#' @param value. The value to assign to that variable.
#' @param env environment. The environment in which assignment takes place.
#' @param active logical. If TRUE, the assignment is made now. If FALSE, delayed assignment takes place and the assignment will be lazy (only made on call).
#' @param locked logical. If TRUE, the assignment can only be made once and no assignment can take place on that variable in that environment again (for the duration of the R session).
assign_ <- function(name, value, env = parent.frame(), active = TRUE, locked = FALSE) {
  if (isTRUE(active)) assign(name, value, env)
  else pryr::`%<d-%`(name, value)
  if (isTRUE(locked)) lockBinding(name, env)
}
assign_('b', 2, locked = TRUE)
b
# [1] 2
b <- 3
# Error: cannot change value of locked binding for 'b'
system.time(assign_('c', {Sys.sleep(1); 1}, active = FALSE))
# user  system elapsed
#    0       0       0
system.time(c)
#TODO: Delayed binding doesn't seem to work.
#TODO: Implement %<d-% myself.

# TODO: I feel like there's some nuance in this question I'm not getting.
