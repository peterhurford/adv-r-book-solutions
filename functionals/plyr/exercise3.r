### Implement a pure R version of split(). (Hint: use unique() and subsetting.) Can you do it without a for loop?

library(magrittr)
split2 <- function(x, f, drop = FALSE, ...) {
  f %>% as.factor %>% unique %>%
    lapply(., function(sf) x[f == sf, ]) %>%
    { names(.) <- levels(f); . }
}

# Test
split2(iris, iris$Species)

identical(
  split(iris, iris$Species),
  split2(iris, iris$Species)
)
