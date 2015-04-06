### What does ecdf() do? What does it return?

# ecdf() rewrites the arguments passed to it, and then calls approxfun() with those variables. 
#TODO: sys.call nuances

## Igor 
Compute an empirical cumulative distribution function. The e.c.d.f. (empirical cumulative distribution function) Fn is a step function with jumps i/n at observation values, where i is the number of tied observations at that value. 
Missing values are ignored.
