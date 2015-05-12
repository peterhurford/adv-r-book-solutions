### One important feature of deparse() to be aware of when programming is that
### it can return multiple strings if the input is too long. For example, the
### following call produces a vector of length two:

g <- function(x) deparse(substitute(x))
g(a + b + c + d + e + f + g + h + i + j + k + l + m +
    n + o + p + q + r + s + t + u + v + w + x + y + z)

### Why does this happen? Carefully read the documentation.

# Deparse has a cutoff (default after 60 bytes) at which a break is made
# into a second string.  This can be changed with the `width.cutoff` parameter
# but cannot exceed 500 bytes.

# One might think the carriage return is responsible for the cutoff, but this
# is not the case:

# Here, it joins a carriage return:
g(a + b + c +
  d)
# [1] "a + b + c + d"

# Here there is no carriage return, but it gets split anyway:
g(a + b + c + d + e + f + g + h + i + j + k + l + m + n + o + p + q + r + s)
# [1] "a + b + c + d + e + f + g + h + i + j + k + l + m + n + o + p + "
# [2] "    q + r + s" "

### Can you write a wrapper around deparse() so that it always returns a single string?

g2 <- function(x) paste(deparse(substitute(x)), collapse = "")
g2(a + b + c + d + e + f + g + h + i + j + k + l + m +
    n + o + p + q + r + s + t + u + v + w + x + y + z)
