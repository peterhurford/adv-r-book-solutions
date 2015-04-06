### What function undoes the action of library()?

# unloadNamespace()


### How do you save and restore the values of options() and par()?

# Save options with `options(thing = val)`.  Get values of options with `getOption(thing)`.

# Save par with `par(thing = val)`.

# To restore to previous values at the end of the function run, do something like:

fn <- function() {
  tmp <- getOption(thing)
  options(thing = 'this_val')
  do_stuff()
  on.exit(options(thing = tmp))
}
