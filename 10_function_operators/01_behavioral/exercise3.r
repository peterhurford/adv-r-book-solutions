### Modify delay_by() so that instead of delaying by a fixed amount of time, it ensures that a certain amount of time has elapsed since the function was last called. That is, if you called g <- delay_by(1, f); g(); Sys.sleep(2); g() there shouldn’t be an extra delay.

library(magrittr)
delay_by <- function(delay, f) {
  force(f); force(delay)
  lastrun <- Sys.time() %>% as.numeric
  function(...) {
    now <- Sys.time() %>% as.numeric
    delay <- delay + lastrun - now
    if (delay > 0) Sys.sleep(delay)
    lastrun <<- Sys.time() %>% as.numeric
    f(...)
  }
}

f <- function(x = 1) identity(x)
microbenchmark::microbenchmark({ g <- delay_by(1, f); g(); Sys.sleep(2); g() }, times = 1)
# 3 sec
microbenchmark::microbenchmark({ g <- delay_by(1, f); g(); g() }, times = 1)
# 2 sec


## alternative 
delay_by <- function(delay, f) {
  force(f)
  prev_t <- 0
  function(...) {
    t <- Sys.time()
    t_elapsed <- as.numeric(t -  prev_t)
    if ( t_elapsed < delay) {
      t_delta <- delay - t_elapsed
      cat(t_delta , 'more seconds before function can be called again \n')
      Sys.sleep(t_delta)
    }
    prev_t <<- t
    f(...)
  }
}

f <- delay_by(5, sum)
f(1:10); f(1:10)
