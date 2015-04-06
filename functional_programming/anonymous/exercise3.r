### Use integrate() and an anonymous function to find the area under the curve for the following functions. Use Wolfram Alpha to check your answers.

### y = x ^ 2 - x, x in [0, 10]
integrate(function(x) x ^ 2 - x, 0, 10)
# 283.3333 with absolute error < 3.1e-12

### y = sin(x) + cos(x), x in [-π, π]
integrate(function(x) sin(x) + cos(x), -pi, pi)
# 5.231803e-16 with absolute error < 6.3e-14

### y = exp(x) / x, x in [10, 20]
integrate(function(x) exp(x) / x, 10, 20)
# 25613160 with absolute error < 2.8e-07

## Igor
3. integrate(function(x) x^2 - x, 0 , 10)
integrate(function(x) sin(x) + cos(x), pi , -pi)
integrate(function(x) exp(x) / x, 10 , 20)
