### Use Filter() and vapply() to create a function that applies a summary statistic to every numeric column in a
### data frame.

library(magrittr)
iris %>% Filter(is.numeric, .) %>% vapply(., median, numeric(1))

# As a function...
func <- function(df) {
  Filter(is.numeric, df) %>% vapply(., summary, numeric(6))
}
