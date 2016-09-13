### Create a list of all the replacement functions found in the base package. Which ones are primitive functions?

# Search for the pattern <- in the base package and bring the function's body(mget). The output is a list.
  infix <- mget(grep("<-",ls('package:base'), value = T), inherits = T)
  m <- sapply(infix, is.primitive) # Loop through the list and test which is a primitive and give back a named vector of T's or F's
  
  names(m[m == T]) # Subset the names of those which are TRUE
# [1] "[[<-"           "[<-"            "@<-"            "<-"             "<<-"            "$<-"           
# [7] "attr<-"         "attributes<-"   "class<-"        "dim<-"          "dimnames<-"     "environment<-" 
# [13] "length<-"       "levels<-"       "names<-"        "oldClass<-"     "storage.mode<-"
