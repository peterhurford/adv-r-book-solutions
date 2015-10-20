### The code below makes one duplication. Where does it occur and why? (Hint: look at refs(y).)

message(c(pryr::address(y), "-" pryr::refs(y)))
x <- data.frame(matrix(runif(100 * 1e4), ncol = 100))
message(c(pryr::address(y), pryr::refs(y)))
medians <- vapply(x, median, numeric(1))

message(c(pryr::address(y), "-", pryr::refs(y)))
y <- as.list(x)
message(c(pryr::address(y), "-", pryr::refs(y)))
for(i in seq_along(medians)) {
  message(c(pryr::address(y), "-", pryr::refs(y)))
  y[[i]] <- y[[i]] - medians[i]
}

#TODO: I can't find the duplication???
