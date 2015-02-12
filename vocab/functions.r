### Explanations for functions I felt like weren't obvious, or well covered already in the chapter.  Erred on the side of inclusion.

?fn       # brings up the man page for function.  Equivalent to `help(fn)`.
str(obj)  # tells you the structure of the obj.  Great with lists.
objA %in% objB      # is objA contained within objB?  TRUE / FALSE for each element in objA.
match(objA, objB)   # returns a vector with the positions within objB that all the elements of objA are contained, or NA if they're not contained.
a = 2     # Assignment operator, gives a the value 2.  Unlike `<-`, it can only be used in the top level of the scope  Just never use `=`.
a <- 2    # Assignment operator that can be used anywhere.
a <<- 2   # Assignment operator, but assigns to a as a global variable (in the root scope).
df$name   # returns the value of the element named 'name' within df.  See "subsetting".
df[x]     # returns the xth element of df (if x is a number) or the element named the value of x if x is a string.  Can be used as a vector.  See "subsetting".
df[[x]]   # returns the value of the xth element of df.  See "subsetting".
with(data, expr)  # evaluates expr with the environment.  For example with(list(y = 2), y + 1) will return 3. Pretty complex stuff.
assign('y', val)  # Assigns the variable denoted by the string 'y' the value of val.  a <- 2 is the same as assign('a', 2).  Can do more complex stuff that `<-` can't.
                  # One potential use for assign is that you can create dynamic varaibles.  For example, `var <- 'x'; assign(var, 2)` assigns x as 2, not var.
get('y')  # Gets the value of the variable denoted by the string 'y'.  Can do more complex stuff.
all.equal(2, 3)   # Tests for approximate equality, unlike 2 == 3, based on a threshold.  For example, `all.equal(2, 3, threshold = 2)` is TRUE, even though 2 != 3.
identical(x, y)   # Tests if x is equal to y.  Much more preferable to x == y, because x == y returns a vector of length equal to the length of x and y and errors a lot.
is.na(x)  # TRUE or FALSE depending on whether x is NA.
complete.cases(df)  # Checks each row of `df` to see if there are any NAs in that row.
is.finite(x)      # Checks if x is finite (not Inf, -Inf, NA, or NaN).
a %% b    # Modulus
a %/% b   # Floor division
abs(x)    # Absolute value
sign(x)   # For each element in x, return 1 if the element is positive or TRUE, -1 if the element is negative, 0 if the element is zero or FALSE
signif(x, y)   # Rounds x to y digits.
exp(x)    # Computes the exponential function of x
sum(x)    # ADds up all the values of x.
prod(x)   # Multiplies all the values of x.
pmax(x)   # `max(c(1, 2, 3), c(4, 5, 2))` is 5, the largest number of all the elements in both args.  But `pmax(c(1, 2, 3), c(4, 5, 2)) is c(4, 5, 2)` -- it goes by vector.
cummax(x) # The cumulative maximum as a vector, i.e., cummax(c(x, y, z)) is c(max(x), max(c(x, y)), max(c(x, y, z)))
diff(x)   # The difference between each point in the vector, i.e. diff(c(x, y)) is y - x.  Gets more complex with `lag`, which extends the comparison.
          # diff(c(w, x, y, z), lag = 2) is c(y - w, z - x).  `differences` applies the diff function recursively.  diff(c(1, 2, 3), differences = 2) = diff(diff(c(1, 2, 3)).
rle(x)    # Run length encoding. Tells you the number of times each element appears in x.
missing(arg)  # Within a function, tells you if `arg` was supplied by the caller or not.
on.exit(x)    # x is evaluated in the function when the function exits (either finishes or errors).  on.exit(browser()) is useful for debugging.
return(x)     # Exits the function and returns x.  Should only be used for early returns.
invisible(x)  # x is evaluated and returned, but not printed on console.  Useful if you want your function to not print output.
a & b         # logical AND operator on each element of the vectors, pairwise comparison.  Output is the length of a.
a && b        # logical AND operator on each vector.  Output is of length 1.
all(expr)     # TRUE if expr is all TRUE and FALSE otherwise.  all(c(1, 2, 3) >= 1) is TRUE but all(c(1, 2, 3) > 1) is FALSE.
any(expr)     # TRUE if any value in expr is TRUE.  This is the opposite of all.
intersect(a, b)   # The shared values of a and b.  intersect(c(1, 2), c(2, 3)) is 2.
union(a, b)       # A joint object that contains all unique elements in both a and b.  union(c(1, 2), c(2, 3)) is c(1, 2, 3).
setdiff(a, b)     # Returns the elements of a that are not in b.  setdiff(c(1, 2), c(2, 3)) is 1.  setdiff(c(2, 3), c(1, 2)) is 3.
setequal(a, b)    # Returns TRUE if all elements of a are in b and all elements of b are in a.  setequal(c(1, 2), c(2, 1)) is TRUE.
which(expr)   # Returns the indicies where expr is TRUE.  which(c(1, 2, 3) > 1) returns 2, 3 because both position 2 and position 3 are greater than 1.
t(mat)        # Returns the transposed matrix of matrix mat.
diag(mat)     # Returns the diagonal of matrix mat.
sweep(mat, margin, fn)  # Systematically manipulate the rows or columns of mat.  See http://stackoverflow.com/questions/3444889/how-to-use-the-r-function-sweep
                        # margin is 1 if you're applying fn to the rows and 2 for columns, or c(1, 2) for both.
data.matrix(df)         # Converts dataframe df to a matrix.
rep(x, y)     # Makes a vector of x, repeated y times.  rep(c(1, 2), 4) is c(1, 2, 1, 2, 1, 2, 1, 2).
rep_len(x, y)           # Repeats x to make a vector of length y.  rep_len(c(1, 2), 4) is c(1, 2, 1, 2).  Equivalent to rep(x, length.out = y).
seq(x)        # Makes a vector starting from 1, to x.  seq(4) is c(1, 2, 3, 4).
seq(x, y)     # Makes a vector starting at x to y.  seq(2, 4) is c(2, 3, 4).  Also use by to change the increment -- seq(2, 10, by = 3) is c(2, 5, 8).
              # one can also use length.out to make a vector from x to y of precisely length.out with even increments.  seq(2, 10, length.out = 3) is c(2, 6, 10).
              # lastly, one can also use along.width to make a sequence of length(along.width).  seq(2, 10, along.with = c(1, 2, 3)) is also c(2, 6, 10).
seq_along(x)  # The same as seq(along.with = x), which is the same as seq(length(x)). Seq_along only takes one argument, so seq_along can only start at 1.
seq_len(x)    # The same as seq(length.out = x).  Also can only start at 1.
rev(x)        # Reverses vector x.  rev(c(x, y, z)) is c(z, y, x).
sample(x)     # Takes the vector x and shuffles all its elements randomly.  Use set.seed to ensure repeatable results.
              # Note that if x is of length one, rather than using x, sample will use seq_along(x).
sample(x, y)  # Does sample(x) and returns just the first y elements.  Good for getting y random elements from x.
              # By default it will not return the same element twice, you can change that by passing replace = TRUE.  This is sampling with replacement.
              # Also of interest, and little known, is you can pass prob and pass a vector of probabilities to weight the results according to that vector.
unlist(l)     # Converts list l into a vector.
split(x, f)   # Splits x (vector or dataframe) into groups defined by levels(f) where f is a factor.
              # See `split(1:10, as.factor(c(1, 2))` and `split(1:10, as.factor(rep(1:2, 5)))` as instructive examples.
expand.grid(a, b, ...)     # Makes all possible combinations of the vector args supplied and makes a dataframe out of them.
                           # See `expand.grid(1:10, 2:11)` and `expand.grid(1:3, 5:8, 22:25)` as instructive examples.
break     # Exits out of a for or while loop without finishing executing the loop.
next      # Exits out of the current iteration of the loop without finishing executing that iteration and advances to the next iteration.
switch(var, val1 = r1, val2 = r2, ...)  # A case statement.  If var has value val1, then return r1.  If var has value val2, then return r2, etc.
ifelse(test, yes, no)                   # Runs test, executes yes if the test is TRUE and executes no otherwise.  Great for quick if this else that expressions.
apply(mat, margin, fn)     # Apply function fn to the rows of matrix mat (if margin is 1) or the columns of mat (if margin is 2).
lapply(obj, fn)       # Iterates over all elements of object obj and returns a list with the result of evaluating function fn on each element.  A lot like Ruby's map function.
                      # For example, lapply(list(a = 2, b = 3), function(x) { x + 1 }) would add one to each value, returning list(a = 3, b = 4).
sapply(obj, fn)       # Like lapply, except instead of returning a list, returns a vector or matrix.
vapply(obj, fn, fv)   # A faster sapply, because you specify fv, which is an example of the desired output.
tapply(obj, f, fn)    # Breaks apart obj by factor f (like we saw with `split`) and then applies function fn to each part.
                      # For more on apply, lapply, sapply, vapply, and tapply, read http://bit.ly/1unY814
replicate(times, expr)     # Distinct from `rep` and `rep_len`.  TODO: Not sure how.
ISOdate(year, month, day)       # Makes a date object.  Can also pass hour, minute, and second.  You can set the timezone with the tz variable.
ISOdatetime(y, m, d, h, m, s)   # Like ISOdate, but passing in an hour, minute, and second is mandatory.
strftime(Sys.time())  # Converts the time into a string.  Can be formatted using http://bit.ly/1BN617P
strptime              # I'm not super clear on the difference between `strftime` and `strptime`, but `strptime` seems to require a formatting string whereas `strftime` does not.
                      # For example, `strptime(Sys.time())` errors.
date()                # Returns today's date.  Does not accept arguments.  (See also `Sys.date()`, which formats things a bit more logically in my opinion, and allows math.)
difftime(day1, day2)      # Tells you the amount of days between day1 and day2.  Can use other units by passing a third parameter with the string of the unit you want.
julian(System.Date())     # Converts the date to julian days, or the number of days since January 1, 4713 BC <http://en.wikipedia.org/wiki/Julian_day>.
months(System.Date())     # Outputs the month of the date as a string.
quarters(System.Date())   # Outputs the quarter (Q1, Q2, Q3, Q4) of the date.
weekdays(System.Date())   # Outputs the day of the week (e.g., Monday).
library(lubridate)        # Load's Hadley's lubridate package <https://github.com/hadley/lubridate> which adds functions making it easier to work with times in R.
grep(needle, haystack)    # Searches object haystack for object needle and returns the position in haystack that needle is in.
                          # Example: `grep(1, c(3, 2, 1))` outputs 1.  Note that needle can only be length one, so `grep(c(2, 1), c(3, 2, 1))` won't work.
                          # Also note that grep (and agrep, grepl, and gsub) all take regex patterns as the search string (needle).
agrep(needle, haystack)   # Like grep, except strings can be off by a little bit.
                          # Compare `agrep('hip', 'happy')` (outputs 1) to `grep('hip', 'happy')`, which outputs `integer(0)`, or no matches.
                          # Futher reading: http://en.wikipedia.org/wiki/Levenshtein_distance
grepl(needle, haystack)   # Don't know why Hadley has you learn `agrep` but not `grepl`. `grepl` is like `grep`, except it returns TRUE or FALSE instead of the index.
                          # Usually `lgrep` is the grep we want when querying interactively, because we're just curious if haystack contains needle.
gsub(needle, replacement, haystack)   # Searches haystack for all instances of needle and replaces them with replacement.
strsplit(what, where)     # Splits object what by every instance of where.
                          # Example: `strsplit("Hello, my name is Paul", " ")` outputs the vector `c("Hello," "my", "name", "is", "Paul")`.
chartr(needle, replacement, haystack)    # `chatr` is a weird function that, letter-by-letter replaces needle with replacement in haystack.
                                         # Example: hartr("Heo", "Hiy", "Hello") replaces "Hello" with "Hilly", because "H" is swapped with "H", "e" with "i", and "o" with "y".
                                         # I challenge you to actually find a use for this.
nchar(x)   # If you want to how many letters are in "hello", you might be tempted to use `length("hello")`.  That's incorrect, because that's about vector length, which is 1.
           # Instead, you want `nchar("hello")`, which is the proper 5.
tolower(x)   # Converts x to entirely lowercase letters.
toupper(x)   # Converts x to entirely upercase letters.
             # There's no R built-in to capitalize just the first letter, but many packages introduce functions that can do it.
             # Alternatively, make your own: `capitalize <- function(x) paste0(toupper(substring(x, 1, 1)), substring(x, 2))
substr(x, start, stop)    # Speaking of that capitalize function, here's what makes it work.  `substr` takes all letters of x from position `start` to position `end`.
substring                 # Substring is like substr, except stop is one million by default.  In nearly every case this gets every letter after the starting position.
                          # If you ever have a word with more than one million letters, I guess it won't work as intended...
                          # Maybe instead they should have done `substring <- function(x, start, stop = nchar(x)) substring(x, start, stop)` because that works in R.
                          # ...But I imagine such an implementation would be much slower.
paste(a, b, ...)          # Pass it as many arguments as you want, and it joins all those arguments as a space separated string.
library(stringr)          # Look at Hadley hustling his own package again.  This one offers various string manipulation functions.  I've never found any of them to be useful...
                          # You can look through the offering in the vignette here: https://github.com/hadley/stringr/blob/master/vignettes/stringr.Rmd
factor(x, levels)         # Factors are like vectors, except they record the space of possible values, called levels.  An example of a factor is male / female.
                          # For example, `factor(c("M", "M", "M"), levels = c("M", "F"))` will remember that there can be "F" values (but not "Q" values), despite "F" and "Q"
                          # not appearing in the original vector.
levels(x)                 # Outputs the factor levels.  For `factor(c("M", "M", "M"), levels = c("M", "F"))`, that's `c("M", "F")`.
nlevels(x)                # Counts the number of levels in x.  For `factor(c("M", "M", "M"), levels = c("M", "F"))`, that's 2.
reorder                   # TODO: To be honest, I don't know how to use this.
relevel(x, new_levels)    # Changes the order of levels in x to become new_levels
                          # Example: `reorder(factor(c("M", "M", "M"), levels = c("M", "F")), "F")` changes levels from `c("M", "F")` to `c("F", "M")`.
                          # TODO: I'm not sure what difference that makes, but some functions operate on the first level.
" " " " " "                         # TODO: I'm not sure whit difference that makes, but some functions operate on the first level.
cut(x, y)                 # Breaks x into y equal parts.
findIntreval(x, b)        # Given breaks b, find out which interval in b contains x.
                          # Example: `findInterval(4, c(3, 6, 9))` returns 1 because 4 is between 3 and 6 (in the first interval).
                          # Note that intervals defined by c(3, 6, 9) are <3 (zeroth interval), 3-5 (first interval), 6-9 (second interval), and >9 (third interval).
interaction(f1, f2)       # Merges together pairwise combinations of factors f1 and f2.
                          # Example: interaction(factor(c("M", "M", "M"), levels = c("M", "F")), factor(c(1, 2, 1), levels = c(1, 2))) is
                          # c(M.1, M.2, M.1) with levels c(M.1, F.1, M.2, F.2).
options(stringsAsFactors = FALSE)   # Data frames will convert character vectors to factors by default.  This annoys nearly everyone.
                                    # By setting this parameter in your R session (or better yet, your ~/.Rprofile), you avoid this from happening.
                                    # See ?data.frame for details.
array(x)                  # An array is basically a one-dimensional matrix.
dim(x)                    # Tells you the dimensions (rows and columns) of a matrix or data frame.
dimnames(x)               # Produces a length 2 list with all the row names and all the column names.
aperm(mat, perm)          # Permutates matrix mat by perm.  Best seen in examples: `matrix(seq(3))` makes a 1-column 3-row matrix, but
                          # `aperm(matrix(seq(3)), c(2, 1))` transforms it into a 3-column 1-row matrix.
library(abind)            # You may know `rbind` that combines multiple matricies or data frames by rows, and `cbind` which combines by columns.
                          # library(abind) loads the abind package, which introduces a function `abind` that does both `rbind` and `cbind`!
                          # Examples: compare `dim(iris)`, `dim(rbind(iris, iris))`, `dim(cbind(iris, iris))`, and `dim(abind(iris, iris))`
                          # Not a Hadley pacakage!
duplicated(x)             # For each element in x, returns FALSE if that element is not already in x and TRUE if it is.
unique(x)                 # Returns a vector of x with all the duplicates removed.
merge(df1, df2)           # Combines df1 and df2, lining them up by shared column names.
sort(x)                   # Puts the values of x into ascending order.  Can pass decreasing = FALSE to make it to descending order.
order(x)                  # Returns the column indicies such that x[order(x)] is the same as sort(x).
rank(x)                   # TODO: Not sure what this does.  Appears to return some sort of ratio?
quantile(x, probs)        # Splits x into even groups defined by probs.  For example, to get quartiles of x, use `quantile(x, seq(0.25, 1, length.out = 4))`.
table(x)                  # Tells you each value of x and how many instances of that value there are.
ftable(x)                 # TODO: Not sure the difference between this and table.
lm(Petal.Length ~ Petal.Width, iris)   # Makes a linear regression, predicting Petal.Length by Petal.Width.
fitted(x)       # Extracts the fitted values for a model.  For example, look at `fitted(fitted(lm(Petal.Length ~ Petal.Width, iris)))`.
predict(x)      # TODO: Not sure what this does.  predict(x) seems to return the same as fitted(x) when x is a formula.
resid(x)        # Extracts the residuals for the fitted values of a model.  For example, look at `resid(lm(Petal.Length ~ Petal.Width, iris))`.
rstandard(x)    # Regression Deletion Diagnostics?  TODO: Don't know what this means.
glm(model)      # Fits a generalized linear model.  For example, glm(lm(Petal.Length ~ Petal.Width, iris)).
hat(model)      # TODO: Also Regression Deletion Diagnostics
influence.measures(model)   # Outputs the relative influence of each data point on the model.
logLik(model)               # Extacts the log liklihood of the model.  TODO: Revisit, figure out what this is.
df                 # F Distribution.  TODO: Revisit, figure out what this is.
deviance(model)    # Returns the deviance of the model.  TODO: Revisit, figure out what this is.
formula(model)     # Extracts the formula from a model.  The formula in lm(Petal.Length ~ Petal.Width, iris) is Petal.Length ~ Petal.Width, iris.
I(obj)          # Indicates that obj object should be treated "as is", which supresses R's attempts to coerce the class of obj to other classes.
anova(model)    # Creates an ANOVA table for a given model.
coef(model)     # Extracts the coefficients for the model and tells you their value in the linear relationship (m in "y = mx + b").
confint(model)  # Computes confidence intervals for all coefficients in a model.  Defaults to 95% confidence intervals, but you can specify with the level argument.
contrasts(fac)  # TODO: Not sure what this does.

#TODO: Come back to these someday...
ansari.test
bartlett.test
binom.test
Box.test
chisq.test
cor.test
fisher.test,
fligner.test
friedman.test
kruskal.test
ks.test
mantelhaen.test
mauchly.test
mcnemar.test
mood.test
oneway.test
pairwise.prop.test
pairwise.t.test
pairwise.wilcox.test
poisson.test
power.anova.test
power.prop.test
power.t.test
PP.test
prop.test
prop.trend.test
quade.test
shapiro.test
t.test
var.test
qbeta
pbeta
dbeta
rbeta
binom
cauchy
chisq
exp
f
gamma
geom
hyper
lnorm
logis
multinom
nbinom
norm
pois
signrank
t
unif
weibull
wilcox
birthday
tukey

# TODO: Pick up from here.
crossprod(mat1, mat2)   # The crossproduct of matricies mat1 and mat2.  Equivalent to (but faster than) t(x) %*% y  #TODO: Learn about matricies (linear algebra)
tcrossprod(mat1, mat2)  # The transposed crossproduct of matricies mat1 and mat2.  x %*% t(y)
eigen(mat)              # Computes eigenvalues and eigenvectors of matrix mat.
qr(mat)                 # Computes the QR decomposition of matrix mat.
svd(mat)                # Computes the singular-value decomposition of matrix mat.
mat1 %*% mat2           # Multiplies (matrix multiplication) mat1 and mat2.
arr1 %o% arr2           # Computes the outer products of arrays arr1 and arr2.
outer(mat1, mat2)       # Equivalent to arr1 %o% arr2.
rcond(mat)              # Approximates the reciprocal condition number of matrix mat.
solve(a, b)             # Solves a system of equations.  Solves for x in a %*% x = b
ls(env)                 # Lists all objects within environment env.
exists(s)               # Pass the name of a variable as a string, and it will tell you TRUE or FALSE if that variable is deinfed.
rm(obj)                 # Remove an object from R memory; will make exists('obj') FALSE.
getwd()                 # Gets the current working directory you are in.
setwd('path/to/dir')    # Changes the current working directory to the directory you specify.
q()                     # Closes the current R session.
source('path/to/file.R')    # Runs the sourced R file.
install.packages(package)   # Installs package from CRAN.
library(package)            # Puts the namespace of the package into your global environment.
                            # This means you don't have to prefix functions with their package name (i.e., package::fn), but it pollutes your global env, which is bad.
                            # Generally the use of `library` is discouraged.
require(package)            # Like `library`, but instead of giving an error if the package is not found, instead it returns FALSE and merely issues a warning.
help.search(str)        # Uses regular expression matching on str and returns all documentation matching that regex string.
apropos(str)            # Returns all objects in the namespace that match the regex string str.
RSiteSearch(str)        # Like `help.search`, but opens up the web browser.
citation(package)       # Gives information on how to cite a package.
demo(str)               # Runs a demo of a given functionality in a package.  Type `demo()` to see all avaibable demos.
example(str)            # Runs an example of a given function, if there is an example in the documentation for that function.
vignette(str)           # Opens up vignettes (more detailed README) for a given function in the web browser, if such vignettes exist.
traceback()             # Prints the callstack for a given error, helping trace the error to where it happened (and why).
browser()               # When browser() runs, any execution halts and an interactive session is started at that point in the code.  Very useful for debugging.
recover()               # TODO: ???
options(error = )       # Options are globals you can set in your session or in your ~/.Rprofile that affect how R works.
                        # Useful options include options(error = browser) or options(error = recover), which will run browser() or recover() respectively whenever R errors.
stop("error")           # Halts the program and raises an error message.
warning("error")        # Raises an error message but does not halt the program.
message("hi")           # Raises a message the same way a warning would, but this message is not considered an error.  Prints in bold.
tryCatch({ block }, error = { error_block }, warning = { warning_block } )   # Executes block.  If there is an error, executes error_block instead of erroring.
                                                                             # Similarly with warnings and warning_block.  This way you can rescue against errors.
try( {block} )          # Similar to, but worse than, tryCatch.
print("hi")             # Prints the string to console.
cat("hi")               # Prints the string to console.  The difference is that print returns its output whereas cat does not.
dput(obj)               # Writes a text version of obj.  Obj can also be a file.
format(str)             # Provides a lot of options for formatting a string.
sink(file)              # Writes R output to a file.
capture.output(expr, file)        # Evaluates expression expr and writes the output to file.
data()                            # Loads a given dataset, passed as the name.  data() shows all datasets.  Example: data(iris)
count.fields('path/to/file')      # Counts the number of fields in a file.
read.csv('path/to/file')          # Reads csv file into R as a dataframe.
write.csv(df, 'path/to/file')     # Writes dataframe df to file as a CSV.
read.delim                        # Reads delimited files similar to read.csv (indeed, they have the same implementation in `read.table` under the hood).
                                  # Note that a csv is a special type of delimited file where the delimitere is comma (`,`).
                                  # The default delimiter for `read.delim` is the blank (``), but this can be changed by passing the `delim` argument.
write.delim                       # Analagous to write.csv.
read.fwf                          # Reads a fixed-width formatted file into an R dataframe.  This is not implemented via `read.table`.
readLines(con)                    # Reads lines from a connection (this can be a file connection by passing 'path/to/file' as con.)
writeLines(con)                   # Writes lines to a connection.
saveRDS(obj, file)                # Serializes obj and stores it in file as an R-specific file.  (This is faster to write or read than csv's, and work for more object types.)
readRDS(file)                     # Reads the R-specific file back into R memory.
save(obj, file)                   # Similar to saveRDS, but with a different serialization procedure.
load(obj)                         # Similar to readRDS.
library(foreign)       # TODO:
dir('path/to')         # Lists the names of all files in path.  dir() lists all files in the current working directory.
basename('path/to')    # Gives the name of the base file in path.  For example, `basename('~/path/to/file') would return 'file'.
dirname('path/to')     # Gives the name of the path for path.  For example, `basename('~/path/to/file') would return 'Users/yourname/path/to/file'.
                       # This may be trivial for file paths, but it makes sense for file names themselves.
                       # For example, if you have '~/path/to/file.R', `basename` would return "file.R" and `dirname` would return "~/path/to".
tools::file_ext        # Returns the extension for file.  For example, tools::file_ext('~/path/to/file.R') returns "R".
file.path('~/path/to')    # Returns the file path for the path, but converts it based on your platform.  For example, file.path('~/path/to') returns '~/path/to' for Macs.
                          # This seems trivial, but it's actually useful because it allows you to list Mac paths and have them work on both Macs and PCs (and other OS's).
path.expand('~/path/to')  # Expands the '~' in '~/path/to' to the system-implemented expanded path (i.e., 'Users/yourname/path/to' for Mac.)
normalizePath('path')     # Expands a relative path into an absolute path.
file.choose()             # Prompts a user to enter a file name interactively, and then returns that filename.
file.copy(from, to)       # Copies a file.  Similar to 'cp' from terminal.
file.create('path')       # Creates a file.
file.remove('path')       # Removes a file.  Similar to 'rm' from terminal.
file.rename(from, to)     # Renames a file, which can move a file.  Similar to 'mv' from terminal.
dir.create('path')        # Creates a directory.  Similar to 'mkdir' from terminal.
file.exists('path')       # Returns TRUE or FALSE whether there is a file at path.
file.info('path')         # Gives stats on a file, such as its size, whether or not it's a directory, when it was created, and more.
tempdir()                 # Returns a string that can be used as a file path to store a temporary directory.  Guaranteed not to conflict with existing directories.
tempfile()                # Like tempdir, but for a file.
download.file(url)        # Downloads a file from the internet.
library(downloader)       # TODO:
