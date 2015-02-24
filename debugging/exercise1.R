### Compare the following two implementations of message2error(). 

message2error <- function(code) {
  withCallingHandlers(code, message = function(e) stop(e))
}
message2error <- function(code) {
  tryCatch(code, message = function(e) stop(e))
}

#TODO:

### What is the main advantage of withCallingHandlers() in this scenario? (Hint: look carefully at the traceback.)

#TODO:
