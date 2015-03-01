### For each model in the previous two exercises, extract R2 using the function below.

rsq <- function(mod) summary(mod)$r.squared

fits <- list(fits1, fits2, fits3, fits4)
lapply(fits, function(fit) lapply(fit, rsq))
