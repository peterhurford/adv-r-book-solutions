### Write a FO that logs a time stamp and message to a file every time a function is run.

timestamp <- function(f, filename) {
  force(f)
  function(...) {
    get_timestamp() %>% write_to_file(., filename)
    f(...)
  }
}

get_timestamp <- function() {
  Sys.time()
}

write_to_file <- function(input, filename) {
  write(input, filename)
}

## In this example, let's stub write_to_file to just cat the output instead:
tmp <- write_to_file
write_to_file <- function(input, filename) { cat('Write', input, 'to', filename, '\n') }
timestamp(identity, 'time.txt')(2)
write_to_file <- tmp
