## Use a field function to prevent the account balance from being directly manipulated. (Hint: create a “hidden” .balance field, and read the help for the fields argument in setRefClass().)

# The Account R4 class introduced by Hadley:

Account <- setRefClass("Account",
  fields = list(balance = "numeric"),
  methods = list(
    withdraw = function(x) {
      balance <<- balance - x
    },
    deposit = function(x) {
      balance <<- balance + x
    }
  )
)
a <- Account$new(balance = 100)

# You can modify balance directly without doing withdraw() or deposit(), which is awkward:
a$balance
# [1] 100
a$balance <- 2
a$balance
# [1] 2

# But change the account to this:
LockedAccount <- setRefClass("Account",
  fields = list(
    .balance = "numeric",
    balance = function(value) {
      if (missing(value)) return(.balance)
      else stop('Cannot assign to balance directly.')
    }
  ),
  methods = list(
    withdraw = function(x) {
      .balance <<- .balance - x
    },
    deposit = function(x) {
      .balance <<- .balance + x
    }
  )
)
al <- LockedAccount$new(.balance = 100)

# and...
al$balance
# [1] 100
al$balance <- 2
# Error in (function (value)  : Cannot assign to balance directly.
al$balance
# [1] 100

# Nice!
# However, if we're sneaky, we can still edit the balance...
al$.balance <- 2
al$balance
# [1] 2

# What we really have to do is use $lock()
Account$lock(balance)
a <- Account$new(balance = 100)
a$balance
# [1] 100
a$balance <- 2
# Error: invalid replacement: reference class field ‘balance’ is read-only
a$balance
# [1] 100
