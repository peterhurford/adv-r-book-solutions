### If a data frame has one million rows, and three variables (two numeric, and one integer), how much space will it take up? Work it out from theory, then verify your work by creating a data frame and measuring its size.

# Should be roughly 1M * 8 * 2 + 1M * 4 = 20M B ~= 20MB because numerics are 8 bytes and integers are 4 bytes, and the two numeric variables are not identical.

len <- 1000000
int <- integer(len)
num1 <- numeric(len)
num2 <- numeric(len)
df <- data.frame(int, num1, num2)
pryr::object_size(df)
# 20MB
