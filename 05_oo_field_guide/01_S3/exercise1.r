### Read the source code for t() and t.test() and confirm that t.test() is an S3 generic and not an S3 method. 
### What happens if you create an object with class test and call t() with it?

# We can see that both t() and t.test() are generics because they both call UseMethod():
  t
# function (x) 
# UseMethod("t")
# <bytecode: 0x7febb780be98>
# <environment: namespace:base>
  t.test
# function (x, ...) 
# UseMethod("t.test")
# <bytecode: 0x7febb13e6868>
# <environment: namespace:stats>

# Method dispatch for t.test() depends on the implicit class of the underlying base type.  For example, 

### Alternative methodology using pryr
library(pryr)
pryr::ftype(t.test)
# > pryr::ftype(t.test)
# [1] "s3"      "generic"
## ^ tells us directly its an s3 generic rather than method, otherwise `pryr::ftype` would explicitly say "s3", "method"
# Create a non-numeric 't' object
  myTestObject <- structure(list(), class = "test")
  t.test(myTestObject)
# Error: is.atomic(x) is not TRUE
# In addition: Warning message:
# In mean.default(x) : argument is not numeric or logical: returning NA
  
# Create a numeric 't' object
  myTestObject2 <- structure(10, class = "test")
  t.test(myTestObject2)
# Error in t.test.default(myTestObject2) : not enough 'x' observations

# It is important to notice that, having defined an object of class "test", e.g. x, calling t(x) no longer transposes x, but effectively calls t.test().  Which is why the use of dots is not recommended in function names.
