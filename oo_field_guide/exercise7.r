### Which S4 generic has the most methods defined for it? Which S4 class has the most methods associated with it?

all.generics <- as.character(getGenerics())
all.classes <- as.character(getClasses())
get.num.methods <- function(fname, mode) {
  if (mode == 'generic') f <- getGeneric(fname)
  else if (mode == 'class') f <- fname
  else return(0)
  if (is.null(f)) return(0)
  if (mode == 'generic') n <- capture.output(showMethods(f))
  else n <- capture.output(showMethods(class=f))
  length(n)-2
}
get.num.methods.generic <- function(fname) { get.num.methods(fname, 'generic') }
get.num.methods.class <- function(fname) { get.num.methods(fname, 'class') }

number_methods <- sapply(all.generics,get.num.methods.generic)
which.max(number_methods)
# coerce 
#     66

number_class_methods <- sapply(all.classes,get.num.methods.class)
which.max(number_class_methods)
# ANY
#  13
