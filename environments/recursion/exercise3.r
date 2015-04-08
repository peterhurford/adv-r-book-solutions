### Write a function called fget() that finds only function objects. It should have two arguments, name and env, and should obey the regular scoping rules for functions: if there's an object with a matching name that's not a function, look in the parent. (This function should be an equivalent of match.fun() extended to take a second argument). For an added challenge, also add an inherits argument which controls whether the function recurses up to the parents or only looks in one environment.




fget(name, environment, inherits=TRUE) {
  
  stopifnot(is.character(name), length(name) == 1)
  
  test <- function(env,name) is.element(name,ls(env)) && is.function(env[[`name`]])
    
  if (test(environment,name)) return(environment[[`name`]])
  if (inherits) {
    while (!identical(environment,emptyenv())) {
      environment <- parent.env(environment)
      if (test(environment,name)) return(environment[[`name`]])
    }
  }
  
  warning(paste(name," not found"))
  NULL
}

# Finds the mean function in the base environment
fget('mean',globalenv())
# function (x, ...) 
# UseMethod("mean")
# <bytecode: 0x7fcfc8d651f0>
# <environment: namespace:base>
  
# Since inherits is false and no local "mean" is available, the code returns NULL
fget('mean',globalenv(),inherits=F)
# NULL
# Warning message:
# In fget("mean", globalenv(), inherits = F) : mean  not found
 
# Now there is a local variable called "mean", but since it is not a function fget still returns the base function
mean <- 10
fget('mean',globalenv())
# function (x, ...) 
# UseMethod("mean")
# <bytecode: 0x7fcfc8d651f0>
# <environment: namespace:base>
 
# Now that there is a local function called "mean", we start getting some interesting behavior:
mean <- function() cat("Hello world")
fget('mean',globalenv())
# function() cat("Hello world")
 
# Finally, we delete the local function.  Now the fget returns the base function as before:
rm("mean")
fget('mean',globalenv())
# function (x, ...) 
# UseMethod("mean")
# <bytecode: 0x7fcfc8d651f0>
# <environment: namespace:base>



