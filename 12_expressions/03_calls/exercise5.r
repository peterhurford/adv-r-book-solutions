### How does mode<- work? How does it use call()?

# It dynamically creates a transformation function (e.g., `as.numeric`,
# `as.logical`, etc.) by using `paste0`, and then executes that by
# using `eval(call())` with that function and the item to be transformed.
