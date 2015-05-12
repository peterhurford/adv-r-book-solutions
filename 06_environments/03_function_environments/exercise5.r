### Write an enhanced version of str() that provides more information about functions. Show where the function was found and what environment it was defined in.

myStr <- function(name) {
  list(
    str = capture.output(str(name)),
    calling = parent.frame(),
    parent = parent.env(environment())
  )
}

a <- function(name) {
  myStr(name)
}

myStr(var)
# $str
# [1] "function (x, y = NULL, na.rm = FALSE, use)  "
#
# $calling
# <environment: R_GlobalEnv>
#
# $parent
# <environment: R_GlobalEnv>

a(var)
# $str
# [1] "function (x, y = NULL, na.rm = FALSE, use)  "
#
# $calling
# <environment: 0x7fe47ce2e4e8>
#
# $parent
# <environment: R_GlobalEnv>
