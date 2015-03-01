### Use both for loops and lapply() to fit linear models to the mtcars using the formulas stored in this list:

formulas <- list(
  mpg ~ disp,
  mpg ~ I(1 / disp),
  mpg ~ disp + wt,
  mpg ~ I(1 / disp) + wt
)

# For loop
fits1 <- list()
i <- 1
for (formula in formulas) { fits1[[i]] <- lm(formula, data = mtcars); i <- i + 1 }
fits1

# lapply
fits2 <- lapply(formulas, lm, data = mtcars)  # or `lapply(formulas, function(f), lm(f, data = mtcars))`
fits2
