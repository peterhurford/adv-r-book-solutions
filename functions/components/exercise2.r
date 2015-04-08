### This code makes a list of all functions in the base package.
### 
    objs <- mget(ls("package:base"), inherits = TRUE)
    funs <- Filter(is.function, objs)
### Use it to answer the following questions:
### 
### 1. Which base function has the most arguments?
### 
### 2. How many base functions have no arguments? What's special about those
###    functions.
###    
### 3. How could you adapt the code to find all primitive functions?

# We can use the following to find that the "scan" function has the most arguments:
  which.max(lapply(funs, function(x) length(formals(x))))
# scan
#  908
# The scan function has 22 arguments:
  length(formals(scan))
# [1] 22

# Note that our procedure does not include primitive functions:
  a.primitive.function = funs[[1]]
  a.primitive.function
# function (e1, e2)  .Primitive("-")
  formals(a.primitive.function)
# NULL

# Most (but not all!) of the functions with zero arguments are primitives
# There are 220 such functions
  funs[lapply(funs, function(x) length(formals(x)))==0]

# We can select just the primitive functions with 
  primitive.funs <- Filter(is.primitive, objs)
# There are 181 of them

  

