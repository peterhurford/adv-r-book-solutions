### What’s the relationship between which() and Position()?

# `which` returns all indices where the logical is TRUE, whereas `Position` only returns the first such index.
# Also, `which` uses a logical syntax, whereas `Position` uses a functional syntax.
# For example, Position(function(x) x > 1, iris$Petal.Length) and which(iris$Petal.Length > 1)[[1]] are the same.

### What’s the relationship between where() and Filter()?

#TODO: WTF is where?
#> where
#Error: object 'where' not found
