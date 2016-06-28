### Implement a pure R version of do.call().

library(magrittr)
do.call2 <- function(what, args) {
  as.name(what) %>% append(args, ., 0) %>%
    as.call(.) %>% eval(.)
}

do.call2(median, 1:10)
# [1] 5.5

do.call2(paste, list("hi", "hello"))
# [1] "hi hello"

## alternative
do2.call <- function(fun, args) {
  eval(as.call(c(as.name(fun), args)))
}
