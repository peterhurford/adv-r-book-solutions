### How could you put the columns in a data frame in alphabetical order?

# Out-of-order data frame
df <- data.frame(a = 1, w = 1, c = 1, b = 1)
df
# a w c b
# 1 1 1 1

# Put them in order
names(df) <- sort(names(df))
df
# a b c w
# 1 1 1 1


# Bonus, here's how to put the *rows* of a dataframe in alphabetical order:

# Out-of-order data frame
df <- data.frame(x = seq(10), y = sample(letters[seq(10)]))
df
    # x y
# 1   1 c
# 2   2 a
# 3   3 i
# 4   4 j
# 5   5 e
# 6   6 b
# 7   7 d
# 8   8 h
# 9   9 f
# 10 10 g

# We'd think to use `sort`, because that can sort letters:
df$y
# [1] "a" "c" "i" "f" "j" "g" "b" "e" "d" "h"
sort(df$y)
# [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j"

# But knowing the letters isn't helpful for putting the dataframe in order, because
# we need something to subset by.  Instead, use `order`.
order(df$y)
# [1]  1  7  2  9  8  4  6 10  3  5

# Then, subset like you would anything else.
df[order(df$y),]
    # x y
# 1   1 a
# 7   7 b
# 2   2 c
# 9   9 d
# 8   8 e
# 4   4 f
# 6   6 g
# 10 10 h
# 3   3 i
# 5   5 j
