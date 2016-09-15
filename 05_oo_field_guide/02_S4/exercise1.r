### Which S4 generic has the most methods defined for it? Which S4 class has the most methods associated with it?

get_num_methods <- function(fname, mode) {
  if (identical(mode, 'generic')) f <- getGeneric(fname)
  else if (identical(mode, 'class')) f <- fname
  else return(0)
  
  if (is.null(f)) return(0)
  if (identical(mode, 'generic')) n <- capture.output(showMethods(f))
           else n <- capture.output(showMethods(class = f))
           
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
