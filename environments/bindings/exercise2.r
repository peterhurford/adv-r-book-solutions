### Create a version of assign() that will only bind new names, never re-bind old names.

assign_ <- function(name, value, env = parent.frame()) {
  if (exists(name, envir = env, inherits = FALSE))
    stop(name, " is already defined.", call. = FALSE)
  else
    assign(name, value, env)
}

assign_("a", 2)
a
# [1] 2
assign_("a", 3)
# Error: a is already defined.
a
# [1] 2
assign_("b", 4)
b
# [1] 4

# You can also use lockBinding()
assign_ <- function(name, value, env = parent.frame()) {
  assign(name, value, env)
  lockBinding(name, env)
}
