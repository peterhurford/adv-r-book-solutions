### R has two classes for representing date time data, POSIXct and POSIXlt which both inherit from POSIXt. Which generics have different behaviours for the two classes? Which generics share the same behaviour?

# First, define the following variables:
posixlt_functions <- methods(class="POSIXlt")
corresponding_posixct_functions <- sub('POSIXlt','POSIXct',posixlt_functions)
posixct_functions <- methods(class="POSIXct")

# The following POSIXlt functions have no corresponding POSIXct function
setdiff(corresponding_posixct_functions,posixct_functions)
#  [1] "anyNA.POSIXct"      "as.double.POSIXct"  "as.matrix.POSIXct"  "as.POSIXct.POSIXct" "duplicated.POSIXct"
#  [6] "is.na.POSIXct"      "length.POSIXct"     "names.POSIXct"      "names<-.POSIXct"    "sort.POSIXct"      
# [11] "unique.POSIXct"

# The following functions are defined for both POSIXlt and POSIXct objects
posixCL <- intersect(corresponding_posixct_functions,posixct_functions)
posixCL
#  [1] "[.POSIXct"             "[<-.POSIXct"           "as.data.frame.POSIXct" "as.Date.POSIXct"       "c.POSIXct"            
#  [6] "format.POSIXct"        "mean.POSIXct"          "print.POSIXct"         "rep.POSIXct"           "summary.POSIXct"      
# [11] "Summary.POSIXct"       "weighted.mean.POSIXct" "xtfrm.POSIXct"   

# Note that weighted.mean.POSIXct cannot be found:
weighted.mean.POSIXct
# Error: object 'weighted.mean.POSIXct' not found

# With this exception, we can examine the source for each of the remaining functions:
for (f in posixCL) {
  
  if (f=='weighted.mean.POSIXct') next
  
  print(f)
  print(body(f))
  
  f2 <- sub('POSIXct','POSIXlt',f)
  print(f2)
  print(body(f2))
  
  cat('\n\n\n')
}


