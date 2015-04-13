### What makes is.vector() and is.numeric() fundamentally different to is.list() and is.character()?

# `is.vector` and `is.numeric` return TRUE for more than one different type, whereas `is.list` and `is.character` return TRUE for only one different type.

# Recall that `is.vector(x)` does not actually test whether `x` is a vector.  (Instead, you must use `is.atomic(x) || is.list(x)`.)  `is.vector` will return TRUE for vectors with no attributes other than names, and this is true for a variety of classes: e.g., `is.vector(c(1, 2))`, `is.vector(c('a', 'b'))`, `is.vector(list(1, 'a'))` are all true, despite the multiple classes (numeric, character, list).

# On the other hand, `is.list` is TRUE only for lists.  `is.list(list(1, 2))` is TRUE, but `is.list(c(1, 2))` is FALSE.

# Similarly, `is.numeric(x)` is true for both integers and doubles, whereas `is.character` is TRUE only for characters.
