### What does evalq() do?

# `evalq(x)` is equivalent to `eval(quote(x))`.

### Use it to reduce the amount of typing for the examples above that use
### both eval() and quote().

eval(quote(x), list(x = 30))
# [1] 30
evalq(x, list(x = 30))
# [1] 30
