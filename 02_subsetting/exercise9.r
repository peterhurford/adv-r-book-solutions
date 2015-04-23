### How would you select a random sample of m rows from a data frame? What if the sample had to be contiguous (i.e. with an initial row, a final row, and every row in between)?

# Define a data frame
  df <- data.frame(matrix(1:50,nrow=10))
  df
#    X1 X2 X3 X4 X5
# 1   1 11 21 31 41
# 2   2 12 22 32 42
# 3   3 13 23 33 43
# 4   4 14 24 34 44
# 5   5 15 25 35 45
# 6   6 16 26 36 46
# 7   7 17 27 37 47
# 8   8 18 28 38 48
# 9   9 19 29 39 49
# 10 10 20 30 40 50

# Number of rows to select
  m = 5
  
# Random rows (no repeats!)
  select <- sample(nrow(df),m)
  df[select,]
#   X1 X2 X3 X4 X5
# 9  9 19 29 39 49
# 8  8 18 28 38 48
# 4  4 14 24 34 44
# 6  6 16 26 36 46
# 5  5 15 25 35 45

# Contiguous sample
  first <- sample(nrow(df)-m+1,1)
  last <- first+m-1
  select <- first:last
  df[select,]
#   X1 X2 X3 X4 X5
# 5  5 15 25 35 45
# 6  6 16 26 36 46
# 7  7 17 27 37 47
# 8  8 18 28 38 48
# 9  9 19 29 39 49

