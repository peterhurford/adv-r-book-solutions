### Instead of relying on promises, you can use formulas created with ~ to
### explicitly capture an expression and its environment. What are the
### advantages and disadvantages of making quoting explicit? How does it
### impact referential transparency?

# Using formulas in this manner would allow for referential transparency,
# but it would make working with NSE much more verbose.  In any situation in which
# it is worth using NSE, it would also be worth not using formulas like this.
