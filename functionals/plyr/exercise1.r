### How does apply() arrange the output? Read the documentation and perform some experiments.

# Apply coerces input to a matrix and the output to a vector.  Output will be...
  # ...an array of dimension n x dim(X)[MARGIN] for n > 1 and MARGIN,
  # ...a vector of length dim(X)[MARGIN] for n = 1,
  # ...a vector of length 0 for n = 0.

# Factor variables are typically coerced to character.
