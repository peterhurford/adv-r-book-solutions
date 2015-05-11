### Use subs() to convert the LHS to the RHS for each of the following pairs:

### a + b + c -> a * b * c
pryr::subs(a + b + c, list("+" = quote(`*`)))

### f(g(a, b), c) -> (a + b) * c
pryr::subs(f(g(a, b), c), list(g = quote(`+`), f = quote(`*`)))

### f(a < b, c, d) -> if (a < b) c else d
pryr::subs(f(a < b, c, d), list(f = quote(`if`)))
