### Use a field function to prevent the account balance from being directly manipulated. (Hint: create a “hidden” .balance field, and read the help for the fields argument in setRefClass().)

Account <- setRefClass("Account", fields = list(balance = "numeric"))
Account$new()
#Reference class object of class "Account"
#Field "balance":
#numeric(0)

a <- Account$new(balance = 100)
a$balance
#[1] 100
a$balance <- 200
a$balance
#[1] 200


Account <- setRefClass("Account", fields = list(balance = "numeric"))
Account$lock("balance")
a <- Account$new(balance = 100)
a$balance
#[1] 100
a$balance <- 200
#Error: invalid replacement: reference class field ‘balance’ is read-only
a$balance
#[1] 100
