### Read the source for pryr::standardise_call(). How does it work?

# It evaluates the function used, and then uses `match.call` to get the
# standard names for all the arguments.


### Why is is.primitive() needed?

# `is.primitive` is used as an escape to just return the call instead of 
# using `match.call` if the function passed is a primitive.  This is done
# because `match.call` does not work for primitives.
