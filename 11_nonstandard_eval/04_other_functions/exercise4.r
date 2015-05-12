### What’s the escape hatch for ggplot2::aes()?

# One can call `rename_aes` directly.


### What about plyr::()?

# I assume `plyr::()` refers to `plyr::.`.

# `plyr::.` lets you specify an env in which to evaluate `...`.


### What do they have in common?

# Both evaluate `...` using `match.call()` and create a structure out of them.


### What are the advantages and disadvantages of their differences?

# `plyr::.` probably requires less knowledge about internals, but is also less
# customizable.
