### Base functions match.fun(), page(), and ls() all try to automatically
### determine whether you want standard or non-standard evaluation. Each uses a
### different approach. Figure out the essence of each approach then compare
### and contrast.

# `match.fun` uses NSE if you pass something other than a length-one character
# or symbol, and does not use NSE otherwise.

# `page` uses NSE if you pass something other than a length-one character.
# Symbols would still trigger NSE.

# `ls` triggers NSE substitute if it cannot evaluate the directory passed as
# a variable, and triggers NSE deparse if the result is not a character.

# The `ls` method seems safest of the three approaches, but is also the least
# performant.
