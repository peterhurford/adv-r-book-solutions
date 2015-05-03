### Predict the results of the following lines of code:

# Recall that `eval(quote(x))` cancels out to `x`.

eval(quote(eval(quote(eval(quote(2 + 2))))))
# Each eval and quote cancels each other out.
# [1] 4

eval(eval(quote(eval(quote(eval(quote(2 + 2)))))))
# Evals and quotes are unbalanced here, so let's go for a deeper look...
# `eval(eval(x))` is equivalent to `eval(x)`.
#
# `quote(eval(quote(eval(quote(2 + 2)))))` will be `eval(quote(eval(quote(2 + 2)))))`
# because `quote` is literal like that.
#
# `eval(quote(eval(quote(2 + 2)))))` cancels out, so it's going to be 4 when evaluated.
# [1] 4

quote(eval(quote(eval(quote(eval(quote(2 + 2)))))))
# As noted twice before, `quote` is literal, so the output will just be what is
# quoted, without evaluation.
# Thus this returns:
# eval(quote(eval(quote(eval(quote(2 + 2))))))
