### Why is using sapply() to get the class() of each element in a data frame dangerous?

# Some inputs have multiple classes.  If you do not include any of these inputs, your output will be a vector.  But if you do include one of these inputs with multiple classes, you'll end up with a list output.  This difference in output class could be unexpected.
# When given an empty list, sapply() returns another empty list instead of the more correct zero-length logical vector.


