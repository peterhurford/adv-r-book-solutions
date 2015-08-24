### Write a function called ast_type() that returns either “constant”, “name”,
### “call”, or “pairlist”. Rewrite logical_abbr(), find_assign(), and bquote2()
### to use this function with switch() instead of nested if statements.

ast_type <- function(x) {
  if (is.atomic(x)) return("constant")
  if (is.name(x)) return("name")
  if (is.call(x)) return("call")
  if (is.pairlist(x)) return("pairlist")
  "Other"
}

logical_abbr <- function(x) {
  switch(ast_type(x),
    "constant" = FALSE,
    "name" = logical_abbr.name(x),
    "call" = logical_abbr.call(x),
    "pairlist" = logical_abbr.call(x)
  )
}
logical_abbr.name <- function(x) {
  identical(x, quote(T)) || identical(x, quote(F))
}
logical_abbr.call <- function(x) {
  for (i in seq_along(x)) {
    if (logical_abbr(x[[i]])) return(TRUE)
  }
  FALSE
}


find_assign <- function(x) {
  switch(ast_type(x),
    "constant" = character(),
    "name" = character(),
    "call" = find_assign.call(x),
    "pairlist" = find_assign.pairlist(x)
  )
}
find_assign.call <- function(x) {
  lhs <- if (identical(x[[1]], quote(`<-`)) && is.name(x[[2]])) {
    as.character(x[[2]])
  } else { character() }
  unique(c(lhs, unlist(lapply(x, find_assign))))
}
find_assign.pairlist <- function(x) {
  unique(unlist(lapply(x, find_assign)))
}


bquote2 <- function(x, where = parent.frame()) {
  switch(ast_type(x),
    "constant" = x,
    "name" = x,
    "call" = bquote2.call(x, where),
    "pairlist" = bquote2.pairlist(x, where)
  )
}
bquote2.call <- function(x, where) {
  if (identical(x[[1]], quote(.))) {
    # Call to .(), so evaluate
    eval(x[[2]], where)
  } else {
    # Otherwise apply recursively, turning result back into call
    as.call(lapply(x, bquote2, where = where))
  }
}
bquote2.pairlist <- function(x, where) {
  as.pairlist(lapply(x, bquote2, where = where))
}
