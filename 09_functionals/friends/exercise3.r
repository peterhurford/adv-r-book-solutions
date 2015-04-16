### The following code simulates the performance of a t-test for non-normal data. Use sapply() and an anonymous function to extract the p-value from every trial.

trials <- replicate(
  100, 
  t.test(rpois(10, 10), rpois(7, 10)),
  simplify = FALSE
)
sapply(trials, function(x) x$p.value)


### Extra challenge: get rid of the anonymous function by using [[ directly.

sapply(trials, `[[`, 'p.value')
