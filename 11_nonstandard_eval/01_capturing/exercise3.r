### pairwise.t.test() assumes that deparse() always returns a length one
### character vector. Can you construct an input that violates this
### expectation? What happens?

# Deparse() will return a length two vector when the bytes in the vector
# exceeds `width.cutoff`, which defaults to 60.  Therefore...

pairwise.t.test(
  c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
  c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
)

#        Pairwise comparisons using t tests with pooled SD
#
#data:  c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,  and
# c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,      1, 1,
# 1, 1, 1, 1) and     1, 1, 1, 1,
#         1, 1)
#
# <0 x 0 matrix>
#
# P value adjustment method: holm

# Note that the function succeeds, but the dimension name for "data" is corrupted.

# `DNAME` or `data.name` printed successfully. The output is a 0x0 matrix because
# incorrect parameter types are passed

x = rnorm(100)
g = gl(2, 1, 100)
## below returns multiple vectors when deparsed with default settings
##' as discussed earlier in chapter.
`a + b + c + d + e + f + g + h + i + j + k + l + m + n + o + p + q + r + s + t + u + v + w + x + y + z` <- g
pairwise.t.test(x, `a + b + c + d + e + f + g + h + i + j + k + l + m + n + o + p + q + r + s + t + u + v + w + x + y + z`)
## ^ works fine as DNAME is wrapped in a paste statement
