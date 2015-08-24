### Read the documentation for pryr::modify_call(). How do you think it works?

# Since the documentation says it rewrites arguments of functions, my expectation
# is that it will use `call` with the function name and the new arguments, using
# `setdiff` to compare to the old arguments in a list.
#
# Failing that, it may rewrite `formals`.


### Read the source code.

# It uses `pryr::standardize_call` to get a standard call object, and then
# rewrites that object, since calls can be rewritten in a similar manner to
# lists.  This was similar to, but not the same as, what I expected (to call
# `call` directly.)
