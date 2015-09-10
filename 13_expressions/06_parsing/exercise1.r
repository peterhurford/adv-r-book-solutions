### What are the differences between quote() and expression()?

# An expression is a list of calls, whereas a quote is a single call.
# can illustrate

 as.list(expression( 2*3))
# [[1]]
# 2 * 3

 as.list(quote( 2*3))
#[[1]]
#`*`

#[[2]]
#[1] 2

#[[3]]
#[1] 3

#Another difference is more subtle: objects of mode "expression" are
#better at retaining their identity as an unevaluated expression

  eval(substitute(2+x,list(x=expression(pi))))
# Error in 2 + expression(pi) : non-numeric argument to binary operator
  eval(substitute(2+x,list(x=quote(pi)))) 
# [1] 5.141593

# ^ taken from http://r.789695.n4.nabble.com/What-is-the-difference-between-expression-and-quote-when-used-with-eval-td1561974.html
