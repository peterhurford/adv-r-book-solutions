### Create a list of all the replacement functions found in the base package. Which ones are primitive functions?

# This is kind of ugly, but it works:
  objs <- mget(ls("package:base"), inherits = TRUE)
  funs <- Filter(is.function, objs)
  
  last.two.chars <- function(x) {
    substr(x,nchar(x)-1,nchar(x))
  }
  base.function.names <- names(funs)
  base.function.names.last2 <- sapply(base.function.names, last.two.chars)
  base.function.names[base.function.names.last2=="<-"]
#  [1] "[[<-"             "[<-"              "@<-"              "<-"               "<<-"              "$<-"              "attr<-"          
#  [8] "attributes<-"     "body<-"           "class<-"          "colnames<-"       "comment<-"        "diag<-"           "dim<-"           
# [15] "dimnames<-"       "Encoding<-"       "environment<-"    "formals<-"        "is.na<-"          "length<-"         "levels<-"        
# [22] "mode<-"           "mostattributes<-" "names<-"          "oldClass<-"       "parent.env<-"     "regmatches<-"     "row.names<-"     
# [29] "rownames<-"       "split<-"          "storage.mode<-"   "substr<-"         "substring<-"      "units<-"  

# And this is even uglier:
  base.function.names[base.function.names.last2=="<-" & unlist(lapply(funs,is.primitive))]
#  [1] "[[<-"           "[<-"            "@<-"            "<-"             "<<-"            "$<-"            "attr<-"         "attributes<-"  
#  [9] "class<-"        "dim<-"          "dimnames<-"     "environment<-"  "length<-"       "levels<-"       "names<-"        "oldClass<-"    
# [17] "storage.mode<-"
