### Implement a function that extracts the diagonal entries from a matrix (it should behave like diag(x) where x is a matrix).

  diag2 <- function(x) {
    v <- c()
    for (i in 1:min(dim(x))) {
      v <- c(v, x[i,i])
    }
    v
  }

  x <- matrix(seq(54), nrow = 6)
  x
#      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9]
# [1,]    1    7   13   19   25   31   37   43   49
# [2,]    2    8   14   20   26   32   38   44   50
# [3,]    3    9   15   21   27   33   39   45   51
# [4,]    4   10   16   22   28   34   40   46   52
# [5,]    5   11   17   23   29   35   41   47   53
# [6,]    6   12   18   24   30   36   42   48   54
  diag(x)
# [1]  1  8 15 22 29 36
  diag2(x)
# [1]  1  8 15 22 29 36
  diag(t(x))
# [1]  1  8 15 22 29 36
  diag2(t(x))
# [1]  1  8 15 22 29 36


# Here is a more code-efficient version of diagonal, but it only works when nrow(x) == ncol(x).
  diag3 <- function(x) x[matrix(seq_len(nrow(x)), nrow = nrow(x), ncol = 2)]
  y <- matrix(seq(9), nrow = 3)
  y
       # [,1] [,2] [,3]
  # [1,]    1    4    7
  # [2,]    2    5    8
  # [3,]    3    6    9
  diag(y)
# [1] 1 5 9
  diag2(y)
# [1] 1 5 9
  diag3(y)
# [1] 1 5 9
  diag(t(y))
# [1] 1 5 9
  diag2(t(y))
# [1] 1 5 9
  diag3(t(y))
# [1] 1 5 9

  diag3(x)  # Remember that for x, nrow(x) != ncol(x)
# [1]  1  8 15 22 29 36
  diag3(t(x))
# Error: subscript out of bounds.
