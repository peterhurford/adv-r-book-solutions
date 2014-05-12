### Given a linear model, e.g. mod <- lm(mpg ~ wt, data = mtcars), extract the residual degrees of freedom. Extract the R squared from the model summary (summary(mod)).

mod <- lm(mpg ~ wt, data = mtcars)
x <- summary(mod)

# residual degrees of freedom
  x$df[2]
# [1] 30

# R-squared
  x$r.squared
# [1] 0.7528328 
