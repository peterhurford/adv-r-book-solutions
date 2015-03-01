### Fit the model mpg ~ disp to each of the bootstrap replicates of mtcars in the list below by using a for loop and lapply(). Can you do it without an anonymous function?

bootstraps <- lapply(1:10, function(i) {
  rows <- sample(1:nrow(mtcars), rep = TRUE)
  mtcars[rows, ]
})

# for loop
fits3 <- list()
i <- 1
for (bootstrap in bootstraps) {
  fits3[[i]] <- lm(mpg ~ disp, data = bootstrap)
  i <- i + 1
}

# lapply
fits4 <- lapply(bootstraps, lm, formula = mpg ~ disp)
fits4
