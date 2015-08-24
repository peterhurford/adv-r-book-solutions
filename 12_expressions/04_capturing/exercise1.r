### Compare and contrast update_model() with update.default().

update_call <- function (object, formula., ...) {
  call <- object$call
  if (!missing(formula.)) {
    call$formula <- update.formula(formula(object), formula.)
  }
  pryr::modify_call(call, pryr::dots(...))
}

update_model <- function(object, formula., ...) {
  call <- update_call(object, formula., ...)
  eval(call, environment(formula(object)))
}

# `update_model` always evaluates the resulting call, whereas `update.default`
# can return the call without evaluation if evaluate = FALSE.
#
# `update.default` evaluates the call in the global environment, whereas
# `update_model` evaluates the call within the environment of the object passed.
#
# `update.default` handles some extras whereas `update_model` does not.
#
# `update_model`'s syntax is less verbose and easier to read.
