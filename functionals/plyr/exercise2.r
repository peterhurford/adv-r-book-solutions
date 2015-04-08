### There’s no equivalent to split() + vapply(). Should there be? When would it be useful?

# vapply is preferable to sapply to control the type of the output, since sapply can be inconsistent in different cases.
# However, since plyr already controls the output type quite well, there's little need to invoke vapply directly.

### Implement one yourself.

library(magrittr)
vvply <- function(X, group, FUN, FUN.VALUE, ...) {
  X %>% split(., group) %>% vapply(., FUN, FUN.VALUE)
}
