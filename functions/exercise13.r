### Create a replacement function that modifies a random location in vector.

  `change.random<-` <- function(v,value) {
    v[sample(length(v),1)] <- value
    v
  }
  
  v <- 1:10
  change.random(v) <- -1
  v

# [1]  1  2  3 -1  5  6  7  8  9 10
