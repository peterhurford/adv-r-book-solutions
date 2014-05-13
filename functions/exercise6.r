### What are the four principles that govern how R looks for values?

# 1. Name masking.  Variables are evaluated according to the highest-precedence environment in which they are defined, starting from the local environment and working upwards through each parent environment.
# 2. Functions vs. variables.  For all intents and purposes, function names are evaluated by the same rules as for variables.  If it is implicit that a function is being used, R will ignore objects with the same name that are not functions.
# 3. Fresh starts.  Functions do not have state (unless the environment of the function is changed). 
# 4. Dynamic lookup.  Variables are evaluated when needed, and so variables may be defined outside of the function's environment.
