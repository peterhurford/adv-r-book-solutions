### Why does as.Date.default() use substitute() and deparse()?

# To print the input into as.Date in the error message to show the
# user what they typed. This is similar to the use case behind `plot` function.
# This will print the function argument w/o executing the code

### Why does pairwise.t.test() use them?

# To populate the dimension names of "data" printed in the table so the user can
# see the inputs. to store the names of both comparison parameters within 1
# character string.
