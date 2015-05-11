### For each of the following pairs of expressions, describe why you can’t use
### subs() to convert one to the other.

### a + b + c -> a + b * c

# You can't convert one "+" to "+" and the other to "*", because subs() converts
# either all instances of the "+" or no instances of the "+".


### f(a, b) -> f(a, b, c)

# Subs cannot be used to add new arguments, only convert.


### f(a, b, c) -> f(a, b)

# Subs cannot be used to subtract new arguments, only convert.
