### We can use on.exit() to implement a simple version of capture.output().

capture.output2 <- function(code) {
   temp <- tempfile()
   on.exit(file.remove(temp), add = TRUE)
 
   sink(temp)
   on.exit(sink(), add = TRUE)
 
   force(code)
   readLines(temp)
}

capture.output2(cat("a", "b", "c", sep = "\n"))

### #> [1] "a" "b" "c"


### You might want to compare this function to the real capture.output() and think about the simplifications
### I've made. Is the code easier to understand or harder? Have I removed important functionality?

### Compare capture.output() to capture.output2(). How do the functions differ? What features have I removed
### to make the key ideas easier to see? How have I rewritten the key ideas to be easier to understand?

# Using `body(capture.output)`, we can see the source code for the original `capture.output` function.
# `capture.output` is a good clip longer (39 lines vs. 7 lines).

#The reason for this is that `capture.output2` is more modular, as `capture.output` writes out
# entire methods like `readLines` instead of invoking them.  This makes `capture.output2` easier to
# understand if you understand the underlying methods.

# However, `capture.output2` does remove potentially important functionality, as `capture.output` appears
# to handle important exceptions not handled in `capture.output2`, and `capture.output` offers the ability
# to chose between overwriting or appending to a file.
