### The escaping rules for <script> and <style> tags are different:
### you don’t want to escape angle brackets or ampersands, but you do want to
### escape </script> or </style>. Adapt the code above to follow these rules.

library(magrittr)

escape <- function(x) UseMethod("escape")
escape.html <- function(x) x
escape.character <- function(x) {
  x <- gsub("&", "&amp;", x)
  x <- gsub("<", "&lt;", x)
  x <- gsub(">", "&gt;", x)
  html(x)
}
escape.list <- function(x) {
  lapply(x, escape)
}

named <- function(x) {
  if (is.null(names(x))) return(NULL)
  x[names(x) != ""]
}
unnamed <- function(x) {
  if (is.null(names(x))) return(x)
  x[names(x) == ""]
}

html <- function(x) structure(x, class = "html")
print.html <- function(x, ...) {
  out <- paste0("<HTML> ", x)
  cat(paste(strwrap(out), collapse = "\n"), "\n", sep = "")
}

tag <- function(tag, escape = TRUE) {
  force(tag)
  function(...) {
    args <- list(...)
    attribs <- named(args)
    children <- args %>% unnamed %>%
      { if (isTRUE(escape)) { escape(.) } else { . } } %>% unlist

    html(paste0(
      "<", tag, attribs, ">",
      paste(children, collapse = ""),
      "</", tag, ">"
    ))
  }
}

p <- tag("p")
b <- tag("b")
script <- tag("script", escape = FALSE)
style <- tag("style", escape = FALSE)

p("Text ", "with &escaping!", b("BOLD &escape!"))
# <HTML> <p>Text with &amp;escaping!<b>BOLD &amp;escape!</b></p>

script("Script has no escape &&&!")
