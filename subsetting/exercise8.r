### How would you random permute the columns of a data frame? (This is an important technique in random forests). Can you simultaneously permute the rows and columns in one step?

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

# Shuffle the rows
  df[sample(nrow(df)),]
#    X1 X2 X3 X4 X5
# 4   4 14 24 34 44
# 8   8 18 28 38 48
# 2   2 12 22 32 42
# 5   5 15 25 35 45
# 9   9 19 29 39 49
# 10 10 20 30 40 50
# 3   3 13 23 33 43
# 1   1 11 21 31 41
# 7   7 17 27 37 47
# 6   6 16 26 36 46

# Shuffle the rows and columns simultaneously
  df[sample(nrow(df)),sample(ncol(df))]
#    X2 X5 X3 X1 X4
# 2  12 42 22  2 32
# 5  15 45 25  5 35
# 1  11 41 21  1 31
# 4  14 44 24  4 34
# 7  17 47 27  7 37
# 8  18 48 28  8 38
# 6  16 46 26  6 36
# 9  19 49 29  9 39
# 10 20 50 30 10 40
# 3  13 43 23  3 33
