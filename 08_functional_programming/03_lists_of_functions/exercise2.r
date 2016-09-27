### Which of the following commands is equivalent to with(x, f(z))?

### x$f(x$z).
### f(x$z).
### x$f(z).
### f(z).
### It depends.

# It depends.

# If function f and vector z are both inside list x, then x$f(x$z) is the correct answer. If only z is inside list x, then f
# is simply a function operating on z. The correct answer would be f(x$z)

# First example:
x <- list()
x$f <- identity
x$z <- 2

with(x, f(z))  # 2
x$f(x$z)       # 2
f(x$z)         # x$z
x$f(z)         # Error in x$f(z) : object 'z' not found
f(z)           # Error: could not find function "f"

# Second example
x <- list()
x$z <- mtcars$mpg
with(x, identity(z))
identity(x$z)
