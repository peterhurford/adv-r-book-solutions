### Create a FO that tracks files created or deleted in the working directory (Hint: use dir() and setdiff().) 

dirs_changed <- function(f) {
  force(f)
  function(...) {
    files_before <- dir()
    f(...)
    files_after <- dir()
    setdiff(files_before, files_after)
  }
}

file.create('tmp')
dirs_changed(file.remove)('tmp')
# [1] "tmp"

## Another function
file_deltas <- function(directory) {
  orig_files <- dir(directory)
  function(...) {
    created <- setdiff(dir(directory), orig_files)
    deleted <- setdiff(orig_files, dir(directory))
    cat('created = ', created, 'deleted = ', deleted, '\n' )
  }
}

### What other global effects of functions might you want to track?
# Any side effect seems fair game, like printing, database interactions, adding or removing global variables, etc.
# Can also track meta-data related to files such as last modification time, etc. 
