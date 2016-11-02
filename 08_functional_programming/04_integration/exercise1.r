### Instead of creating individual functions (e.g., midpoint(), trapezoid(), simpson(), etc.), we could store them in a list.
### If we did that, how would that change the code? 
### A list like that could be made by typing:
manual_newton_cotes_list <- list(
  rectangle = function(f, a, b) {
    (b - a) * f((a - b) / 2)
  },
  trapezoid = function(f, a, b) {
    (b - a) / 2 * (f(a) + f(b))
  }
)

### and functions in that list could be called as follows:
manual_newton_cotes_list$rectangle(function(x) x^2, 0, 1) # 1/4

### Can you create the list of functions from a list of coefficients for the Newton-Cotes formulae?
### We start by writing the following closure:
newton_cotes_maker <- function(coefs){
  function(f, a, b) {
    pos <- function(i) a + i * (b - a) / (length(coefs) - 1)
    fi <- function(i) f(pos(i))
    (b - a)/ sum(coefs) * sum(coefs * fi(0:9)[1:length(coefs)])
  }
}

### We then use the closure to make a list of Newton-Cotes functions:
newton_cotes_list <- list(
  trapezoid = newton_cotes_maker(c(1, 1)),
  simpson = newton_cotes_maker(c(1, 4, 1)),
  boole = newton_cotes_maker(c(7, 32, 12, 32, 7))
)

newton_cotes_list$trapezoid(function(x) x^2, 0, 1) # 1/2
newton_cotes_list$simpson(function(x) x^2, 0, 1) # 1/3
newton_cotes_list$boole(function(x) x^2, 0, 1) # 1/3
