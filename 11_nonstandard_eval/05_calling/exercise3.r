### How does pryr::named_dots() work? Read the source.

# It captures the dot arguments using pryr::dots (which is just
# `eval(substitute(alist(...)))`), and then gets the names of the arguments,
# using "" for the arguments without names.

# If all the args are "", it simply returns the args.  Otherwise, it names
# the args with their values, and returns the re-named list of args.
