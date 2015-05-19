### How are alist(a) and alist(a = ) different? Think about both the input and
### the output.

# An easy way to see the difference is by making functions with those args.

pryr::make_function(alist(a), quote(a))
# Error: all_named(args) is not TRUE

pryr::make_function(alist(a = ), quote(a))
# function (a) { a }


# `alist(a)` returns an unnamed list of length 1 with the first element being
# the name `a` (note that this refers to the `name` class, which is distinct
# from being named `a`), so it is unsuitable for use in a function. 
# `alist(a = )` returns a named list with the first element having name `a`
# and the first element being empty.
