### Why does mtcars[1:20] return a error? How does it differ from the similar mtcars[1:20, ]?

# The latter command has an empty second argument to the subsetting operators, which is interpreted as "return all columns":
  mtcars[1:20,]
#                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
# Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
# Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
# Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
# Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
# Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
# ----
#                      mpg cyl  disp  hp drat    wt  qsec vs am gear carb
# Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
# Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
# Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
# Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
# Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1

# The first command is expecting a second argument due to the fact that mtcars is a two-dimensional object.  However, an empty argument is different from NO argument, and so the first command produces an error due to the missing comma:
  mtcars[1:20]
# Error in `[.data.frame`(mtcars, 1:20) : undefined columns selected
