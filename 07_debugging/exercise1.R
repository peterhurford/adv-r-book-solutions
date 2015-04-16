### Compare the following two implementations of message2error(). 

message2error <- function(code) {
  withCallingHandlers(code, message = function(e) stop(e))
}
message2error_ <- function(code) {
  tryCatch(code, message = function(e) stop(e))
}

### What is the main advantage of withCallingHandlers() in this scenario? (Hint: look carefully at the traceback.)

rm(a)
message2error(a)
#Error in withCallingHandlers(code, message = function(e) stop(e)) :
#  object 'a' not found
traceback()
#2: withCallingHandlers(code, message = function(e) stop(e)) at #2
#1: message2error(a)
message2error_(a)
#Error in doTryCatch(return(expr), name, parentenv, handler) :
#  object 'a' not found
traceback()
#5: doTryCatch(return(expr), name, parentenv, handler)
#4: tryCatchOne(expr, names, parentenv, handlers[[1L]])
#3: tryCatchList(expr, classes, parentenv, handlers)
#2: tryCatch(code, message = function(e) stop(e)) at #2
#1: message2error_(a)

# The traceback for the tryCatch implementation (message2error_) goes deeper than we would like, past tryCatch, which confuses the user.
