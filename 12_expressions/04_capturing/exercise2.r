### Why doesn’t write.csv(mtcars, "mtcars.csv", row = FALSE) work?
### What property of argument matching has the original author forgotten?

# `write.csv` rewrites the call, which does not allow R to use it's natural
# `match.call` to expand `row` to `row.names`.
