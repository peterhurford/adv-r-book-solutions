### What classes have a method for the Math group generic in base R? Read the source code. How do the methods work?

# The documentation states, "Base R contains factor, data.frame and difftime methods for [the Math group]."

# These functions are defined as primitives:

  sqrt
# function (x)  .Primitive("sqrt")

showMethods("Math")
Function: Math (package base)
#x="CsparseMatrix"
#x="ddenseMatrix"
#x="denseMatrix"
#x="dgeMatrix"
#x="nonStructure"
#x="sparseMatrix"
#x="structure"

methods('Math')
#[1] Math.auc*       Math.ci*        Math.ci.auc*    Math.ci.coords*
#[5] Math.ci.se*     Math.ci.sp*     Math.data.frame Math.Date
#[9] Math.difftime   Math.factor     Math.POSIXt
