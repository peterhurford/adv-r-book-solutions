### The use of ... for all functions has some big downsides. There’s no input
### validation and there will be little information in the documentation or
### autocomplete about how they are used in the function. Create a new function
### that, when given a named list of tags and their attribute names (like
### below), creates functions which address this problem.

### All tags should get class and id attributes.


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

tag <- function(tag, attrs = NULL, escape = TRUE, void = FALSE) {
  force(tag); force(escape); force(void)
  attrs <- c(attrs, "class", "id") %>% unique

  fn <- function() {
    if (isTRUE(void)) {
      if (length(list(...)) > 0) {
        stop("Tag ", tag, " can not have children", call. = FALSE)
      }
    } else {
      children <- list(...) %>%
        { if (isTRUE(escape)) { escape(.) } else { . } } %>% unlist
    }

    browser()

    # called_attribs <- named(args)

    # html(paste0(
    #   "<", tag, called_attribs, ">",
    #   if (!isTRUE(void)) { paste(children, collapse = "") } else { "" },
    #   "</", tag, ">"
    # ))
  }

  formals(fn) <- eval(parse(
    text = paste0("alist(..., ", paste(attrs, "= NULL", collapse = ", "), ")")
  ))
  fn
}


register_html <- function(...) {
  tags <- list(...)
  for (i in seq_along(tags)) {
    if (is.null(names(tags[[i]]))) {
      tag_name <- tags[[i]]
      tag_value <- tag(tag_name)
    } else {
      tag_name <- names(tags[[i]])
      tag_value <- tag(tag_name,
        attrs = unnamed(tags[[i]]),
        void = isTRUE(tags[[i]]$void),
        escape = isTRUE(tags[[i]]$escape)
      )
    }
    assign(tag_name, tag_value, .GlobalEnv)
  }
}

register_html("p")

# register_html(
#   "p",
#   "b",
#   a = c("href"),
#   img = list(c("src", "width", "height"), void = TRUE),
#   script = list(c("tag"), escape = FALSE)
# )

p("Text ", "with &escaping!", b("BOLD &escape!"))
# <HTML> <p>Text with &amp;escaping!<b>BOLD &amp;escape!</b></p>

script("Script has no escape &&&!")
# <HTML> <script>Script has no escape &&&!</script>
