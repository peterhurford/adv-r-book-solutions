### Write wait_until() which delays execution until a specific time.

wait_until <- function(wait_until_this_timestamp, f) {
  delay <- as.numeric(wait_until_this_timestamp) - as.numeric(Sys.time())
  force(f)
  function(...) {
    if (delay > 0) {
      cat('This function will execute in', delay, 'seconds.\n')
      Sys.sleep(delay)
    }
    f(...)
  }
}

next_year <- lubridate::year(Sys.Date()) + 1
my_next_birthday <- as.POSIXct(paste0(next_year, '-12-11 00:00:00'))
wait_until(my_next_birthday, cat)('Happy birthday!')
