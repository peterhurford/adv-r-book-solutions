### What other types of input and output are missing? Brainstorm before you look up some answers in the plyr paper.

# lapply handles list-to-list and sapply / vapply handles array-to-array.
# But while lapply can handle dataframe inputs, nothing (outside of plyr) handles dataframe output.
# coercing to a matrix is also not fully handled. 
