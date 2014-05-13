### Clarify the following list of odd function calls:

x <- sample(replace = TRUE, 20, x = c(1:10, NA))
# For this function I might just use the parameter names and put them in the order in which they are expected:
x <- sample(x = c(1:10, NA), size = 20, replace = TRUE)

y <- runif(min = 0, max = 1, 20)
# In the case of this easily understood function, it might be clearer to omit names altogether:
y <- runif(20,0,1)

cor(m = "k", y = y, u = "p", x = x)
# This uses partial matching to work.  It would be much clearer to write:
cor(x,y, use = "pairwise.complete.obs", method="kendall")
