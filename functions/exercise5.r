### What does the following code return? Why? What does each of the three c's mean?

  c <- 10
  c(c = c)
#  c 
# 10 

# The c() function creates a vector by combining its elements.  The left-hand-side c indicates the name of the single argument, which is the character 'c'.  The final c is a local variable that evaluates to the number 10.
