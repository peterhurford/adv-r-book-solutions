### One important feature of deparse() to be aware of when programming is that
### it can return multiple strings if the input is too long. For example, the
### following call produces a vector of length two:

g <- function(x) deparse(substitute(x))
g(a + b + c + d + e + f + g + h + i + j + k + l + m +
    n + o + p + q + r + s + t + u + v + w + x + y + z)

### Why does this happen? Carefully read the documentation.

# Substitute captures the return from line six to line seven and
# deparse prints multi-line calls as multiple character vectors.

### Can you write a wrapper around deparse() so that it always returns a single string?

g2 <- function(x) paste(deparse(substitute(x)), collapse = "")
g2(a + b + c + d + e + f + g + h + i + j + k + l + m +
    n + o + p + q + r + s + t + u + v + w + x + y + z)
