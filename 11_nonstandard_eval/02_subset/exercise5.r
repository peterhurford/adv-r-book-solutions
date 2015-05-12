### The second argument in subset() allows you to select variables. It treats
### variable names as if they were positions. This allows you to do things like
### subset(mtcars, , -cyl) to drop the cylinder variable, or
### subset(mtcars, , disp:drat) to select all the variables between disp and
### drat. How does this work? I’ve made this easier to understand by extracting
### it out into its own function.

select <- function(df, vars) {
  vars <- substitute(vars)
  var_pos <- setNames(as.list(seq_along(df)), names(df))
  pos <- eval(vars, var_pos)
  df[, pos, drop = FALSE]
}
select(mtcars, -cyl)

### Let's look at this...
vars <- substitute(-cyl)
vars
# -cyl
df <- mtcars
var_pos <- setNames(as.list(seq_along(df)), names(df))
# Returns the positions of all the variable names, including cyl.
pos <- eval(vars, var_pos)
pos
# -2
# Evaluates "cyl" to its index (2) and the "-" in front of cyl to -2.
# this -2 is then used to subset df, which throws out cyl.
