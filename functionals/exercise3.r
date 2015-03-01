

formulas <- list(
  mpg ~ disp,
  mpg ~ I(1 / disp),
  mpg ~ disp + wt,
  mpg ~ I(1 / disp) + wt
)

# For loop
fits <- list()
i <- 1
for (formula in formulas) { fits[[i]] <- lm(formula, data = mtcars); i <- i + 1 }
fits

# lapply
rm(fits)
fits <- lapply(formulas, lm, data = mtcars)  # or `lapply(formulas, function(f), lm(f, data = mtcars))`
fits
