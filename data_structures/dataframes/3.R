### Can you have a data frame with 0 rows? What about 0 columns?

> df <- data.frame()
> df
data frame with 0 columns and 0 rows
> class(df)
[1] "data.frame"
> dim(df)
[1] 0 0

# Seems like that worked!  0 rows AND 0 columns?

# But can we have a dataframe with 0 rows and >=1 column?
# Or a dataframe with >=1 rows but 0 columns?
# It doesn't seem so.
