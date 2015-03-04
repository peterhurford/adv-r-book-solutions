### Which of the following commands is equivalent to with(x, f(z))?

### x$f(x$z).
### f(x$z).
### x$f(z).
### f(z).
### It depends.

# x$f(x$z).  with(a, b) attaches all objects in b onto a.  So f gets attached (x$f) and z gets attached (x$z).

# For example:
x <- list()
x$f <- identity
x$z <- 2

with(x, f(z))  # 2
x$f(x$z)       # 2
f(x$z)         # x$z
x$f(z)         # Error in x$f(z) : object 'z' not found
f(z)           # Error: could not find function "f"
