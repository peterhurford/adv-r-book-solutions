### Use microbenchmarking to rank the basic arithmetic operators (+, -, *, /,
### and ^) in terms of their speed. Visualise the results. Compare the speed of
### arithmetic on integers vs. doubles.

microbenchmark::microbenchmark(2 + 2, 2 - 2, 2 * 2, 2 / 2, 2 ^ 2)
# Unit: nanoseconds
#  expr  min    lq   mean median    uq  max neval
# 2 + 2  81  95.0  155.02     98 145.5 3706   100
# 2 - 2  82  92.5  128.82     97 137.0 1061   100
# 2 * 2  82  94.0  118.19     96 141.0  419   100
# 2/2    80  93.0  120.65     97 143.0  384   100
# 2^2    136 142.0 233.08    147 232.0 4764   100

microbenchmark::microbenchmark(2 + 2, 2.0 + 2.1)
# Unit: nanoseconds
#     expr min lq   mean median  uq  max neval
#    2 + 2  74 80 133.33  130.5 145  457   100
#  2 + 2.1  73 79 169.88  133.0 157 3630   100

microbenchmark::microbenchmark(2 - 2, 2.0 - 2.1)
# Unit: nanoseconds
#     expr min lq   mean median  uq  max neval
#    2 - 2  73 80 162.64    135 143 3988   100
#  2 - 2.1  74 78 136.17    132 146  434   100

microbenchmark::microbenchmark(2 * 2, 2.0 * 2.1)
# Unit: nanoseconds
#     expr min lq   mean median    uq  max neval
#    2 * 2  75 81 134.22    137 149.5  481   100
#  2 * 2.1  76 82 163.48    139 149.5 2697   100

microbenchmark::microbenchmark(2 / 2, 2.0 / 2.1)
# Unit: nanoseconds
#   expr min lq   mean median    uq  max neval
#    2/2  75 79 125.60  122.5 145.0  419   100
#  2/2.1  75 80 171.74  136.0 163.5 3494   100

microbenchmark::microbenchmark(2 ^ 2, 2.0 ^ 2.1)
# Unit: nanoseconds
#   expr min    lq   mean median    uq  max neval
#    2^2 117 132.0 237.72    183 221.5 4587   100
#  2^2.1 144 159.5 227.71    202 249.5 1290   100
