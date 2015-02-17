### Which S4 generic has the most methods defined for it? Which S4 class has the most methods associated with it?

all_generics <- as.character(getGenerics())
all_classes <- as.character(getClasses())

get_num_methods <- function(fname, mode) {
  if (identical(mode, 'generic')) f <- getGeneric(fname)
  else if (identical(mode, 'class')) f <- fname
  else return(0)

  if (is.null(f)) return(0)
  n <- if (identical(mode, 'generic') capture.output(showMethods(f))
  else capture.output(showMethods(class = f))

  length(n) - 2
}

get_num_methods.generic <- function(fname) { get_num_methods(fname, 'generic') }
get_num_methods.class <- function(fname) { get_num_methods(fname, 'class') }

number_methods <- sapply(all_generics, get_num_methods.generic)
which.max(number_methods)
# coerce 
#     66

number_class_methods <- sapply(all_classes, get_num_methods.class)
which.max(number_class_methods)
# ANY
#  13
