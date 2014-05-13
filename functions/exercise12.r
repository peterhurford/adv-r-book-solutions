### Create infix versions of the set functions intersect(), union(), and setdiff().

# intersection
  `%^%` <- function(a,b) {
    unique(a[is.element(a,b)])
  }
  c(1,1,2,2,3,4) %^% c(2,3,4,5)
# [1] 2 3 4
  
# union
  `%+%` <- function(a,b) {
    unique(c(a,b))
  }
  c(1,1,2,2,3,4) %+% c(2,3,4,5)
# [1] 1 2 3 4 5
  
# set difference
  `%-%` <- function(a,b) {
    unique(a[!is.element(a,b)])
  }
  c(1,1,2,2,3,4) %-% c(2,3,4,5)
# [1] 1
