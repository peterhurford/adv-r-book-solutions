### Which S4 generic has the most methods defined for it? Which S4 class has the most methods associated with it?

all.generics <- as.character(getGenerics())
get.num.methods <- function(fname) {
  f <- getGeneric(fname)
  if (is.null(f)) return(0)
  n <- capture.output(showMethods(f))
  length(n)-2
}
number_methods <- sapply(all.generics,get.num.methods)
which.max(number_methods)
# coerce 
#     66
