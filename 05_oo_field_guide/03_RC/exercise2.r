### I claimed that there aren’t any RC classes in base R, but that was a bit of a simplification. Use getClasses() and find which classes extend() from envRefClass. What are the classes used for? (Hint: recall how to look up the documentation for a class.)

# You can find the documentation for a class with a special syntax: class?className, e.g., class?mle.
allClasses <- getClasses()
ext <- names(which(sapply(allClasses, function(x) extends(x,'envRefClass'))))
ext
## [1] "envRefClass"      "localRefClass"    "refGeneratorSlot"
