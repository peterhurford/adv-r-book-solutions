### Which S4 generic has the most methods defined for it? Which S4 class has the most methods associated with it?

all_generics <- as.character(getGenerics())
all_classes <- as.character(getClasses())

get_num_methods <- function(fname, mode) {
  if (identical(mode, 'generic')) {
    n <- capture.output(showMethods(fname))
  } else if (identical(mode, 'class')) {
    n <- capture.output(showMethods(class = fname))
  } else {
    return(0)
  }
  length(n) - 2
}

number_methods <- sapply(all_generics, get_num_methods, 'generic')
number_methods[which.max(number_methods)]
# initialize 
#  47 

number_class_methods <- sapply(all_classes, get_num_methods, 'class')
number_class_methods[which.max(number_class_methods)]
# ANY 
# 160 
