### What does with() do?

# `with` evaluates an R expression within an environment created
# from data (e.g., an environment, list, or data.frame).


### How does it work?  Read the source code for with.default().

# `with.default` is just a wrapper for the standard `eval(substitute())`
# block that we've seen before, using `data` as the eval environment.


### What does within() do?

# `within` does what `with` does, but then modifies a copy of `data`
# to have the modifications.  This makes it an alternative to `transform`.

identical(
  within(iris, {
    Sepal.Length <- round(Sepal.Length / 2)
  }),
  transform(iris, Sepal.Length = round(Sepal.Length / 2))
)
# [1] TRUE

# `with` cannot be used to modify iris, but we can get close...
identical(
  within(iris, {
    Sepal.Length <- round(Sepal.Length / 2)
  }),
  {
    iris$Sepal.Length <- with(
      iris,
      { Sepal.Length <- round(Sepal.Length / 2); Sepal.Length }
    )
    iris
  }
)
# [1] TRUE


### How does it work? Read the source code for within.data.frame().

# `within.data.frame` creates an environment with all the information of `data`,
# turns it into a list, and then uses the list to transform data.


### Why is the code so much more complex than with()?

# `within` has to actually perform the transformation, whereas `with` does not.
# See the example above to see the extra work that `within` does.
