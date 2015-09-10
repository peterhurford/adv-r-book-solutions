### Read the help for deparse() and construct a call that deparse()
### and parse() do not operate symmetrically on.

# If we look back at 11_nonstandard_eval/01_capturing/exercise3.r, we can recall
# that deparse() will return a length two vector when the bytes in the vector
# exceeds `width.cutoff`, which defaults to 60.  Therefore...

parse(text = deparse(c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)))
# expression(c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
# 1, 1, 1, 1, 1, 1))

# This has a carriage return within it, but it still looks pretty symmetrical.

# Looking through the deparse help page produces a few other quotes for what we
# might do:

# An object that isn't deparsable?

# " Using ‘control = "all"’ comes closest to making ‘deparse()’ an
# " inverse of ‘parse()’.  However, not all objects are deparse-able
# " even with this option and a warning will be issued if the function
# " recognizes that it is being asked to do the impossible.

# But I can't figure out what this object might be...


# Floats with >15 digits?

# " Numeric and complex vectors are converted using 15 significant
# " digits: see ‘as.character’ for more details.

parse(text = deparse(c(0.1234567890123456, 0.2345678901234567)))
# expression(c(0.123456789012346, 0.234567890123457))

# Seems fine to me!


# Attributes?

# " To avoid the risk of a source attribute out of sync with the
# " actual function definition, the source attribute of a function
# " will never be deparsed as an attribute.

fn <- mean
attributes(fn) <- list("fn" = TRUE)
fn
# function (x, ...)
# UseMethod("mean")
# <bytecode: 0x7fd26cddae70>
# <environment: namespace:base>
# attr(,"fn")
# [1] TRUE

deparse(fn)
# [1] "structure(function (x, ...) "    "UseMethod(\"mean\"), fn = TRUE)"

parse(text = deparse(fn))
# expression(structure(function (x, ...)
# UseMethod("mean"), fn = TRUE))

# Parse makes expressions not functions, but this reproduction still seems
# quite faithful to the original!


# .Internal calls?

# " Deparsing internal structures may not be accurate: for example the
# " graphics display list recorded by ‘recordPlot’ is not intended to
# " be deparsed and ‘.Internal’ calls will be shown as primitive
# " calls.

parse(text = deparse(paste))
# expression(function (..., sep = " ", collapse = NULL)
# .Internal(paste(list(...), sep, collapse))) "))

# Also seems fine to me.

# I guess R gives less credit to itself than it deserves!
