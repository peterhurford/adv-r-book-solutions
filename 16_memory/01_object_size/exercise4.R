### Which takes up more memory: a factor (x) or the equivalent character vector (as.character(x))? Why?

# The equivalent character vector should take up less memory because you don't have to store the levels.

fact <- factor(c("a", "b"))
str <- as.character(fact)
pryr::object_size(fact)
# 520 B
pryr::object_size(str)
# 152 B

