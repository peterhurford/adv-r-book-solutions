### Implement a pure R version of do.call().

library(magrittr)
do.call2 <- function(what, args) {
  if (!is.list(args)) { args <- list(args) }
  substitute(what) %>% append(args, ., 0) %>%
    as.call(.) %>% eval(.)
}

do.call2(median, 1:10)
# [1] 5.5

do.call2(paste, list("hi", "hello"))
# [1] "hi hello"

## alternative
do2.call <- function(fun, args) {
  eval(call(as.character(substitute(fun)), unlist(args)))
}
