###  scan() has the most arguments (21) of any base function. About how much
###  time does it take to make 21 promises each time scan is called? Given a
###  simple input (e.g., scan(text = "1 2 3", quiet = T)) what proportion of
###  the total run time is due to creating those promises?

microbenchmark::microbenchmark(scan(text = "1 2 3", quiet = TRUE))
# Unit: microseconds
#                             expr    min     lq    mean median     uq     max
#  scan(text = "1 2 3", quiet = T) 46.997 48.645 53.6179 49.443 58.273 149.495
#  neval
#    100

#TODO: Not sure how to determine the portion specifically for promises.
