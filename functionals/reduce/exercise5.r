### Implement the span() function from Haskell: given a list x and a predicate function f, span returns the location of the longest sequential run of elements where the predicate is true. (Hint: you might find rle() helpful.)

library(magrittr)
Span <- function(f, x) {
  x %>% f() %>% rle() %>% .$lengths -> lens
  lens %>% which.max() -> max
  max %>% { . - 1 } %>% seq(1, .) %>% lens[.] %>% sum -> start
  seq(start, start + lens[[max]])
}
#TODO: Probably there is a more efficient approach

Span(function(x) x > 1, iris$Petal.Length)
Span(function(x) x > 4, iris$Petal.Length)
