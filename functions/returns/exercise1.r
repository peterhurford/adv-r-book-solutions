### How does the chdir parameter of source() compare to in_dir()? Why might you prefer one approach to the other?

# The R-Doc for `source()` (use `help(source)`) shows that chdir indicates that "the R working directory is temporarily changed to the directory containining file" if TRUE, that is whether or not your file is not in the current working directory.  On the other hand, `in_dir` (`help(indir)`) can save the previous working directory whenever a new working directory is set, so that it can still be accessed.
