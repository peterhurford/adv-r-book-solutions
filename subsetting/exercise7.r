### Given a linear model, e.g. mod <- lm(mpg ~ wt, data = mtcars), extract the residual degrees of freedom. 

mod <- lm(mpg ~ wt, data = mtcars)
mod_sum <- summary(mod)

mod_sum$df[2]
# [1] 30

mod$df.residual
# [1] 30

### Extract the R squared from the model summary (summary(mod)).
mod_sum$r.squared
# [1] 0.7528328 
