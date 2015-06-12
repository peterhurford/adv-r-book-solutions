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
  attrs <- c(attrs, "class", "id") %>% unlist %>% unique

  fn <- function() {
    passed_args <- named(as.list(sys.call())[-1])
    if (!all(names(passed_args) %in% attrs)) {
      stop(tag, " only takes can implement the following: ",
        paste0(attrs, collapse = ", "), "\n",
        "You tried to implement ",
        paste0(names(passed_args[which(!passed_args %in% attrs)]), collapse = ", "))
    }

    if (isTRUE(void)) {
      if (length(list(...)) > 0) {
        stop("Tag ", tag, " can not have text.", call. = FALSE)
      }
    } else {
      children <- list(...) %>% unnamed %>%
        { if (isTRUE(escape)) { escape(.) } else { . } } %>% unlist
    }

    html(paste0(
      "<", tag,
      if (length(passed_args) > 0) {
        paste0(" ", names(passed_args), " = \"", passed_args, "\"", collapse = " ")
      } else { "" },
      if (!isTRUE(void)) { paste0(">") } else { "" },
      if (!isTRUE(void)) { paste0(children, collapse = "") } else { " \\>" },
      if (!isTRUE(void)) { paste0("</", tag, ">") } else { "" }
    ))
  }

  formals(fn) <- eval(parse(
    text = paste0("alist(... =, ", paste(attrs, "= NULL", collapse = ", "), ")")
  ))
  fn
}


register_html <- function(...) {
  tags <- list(...)
  for (i in seq_along(tags)) {
    if (length(named(tags[i])) == 0) {
      tag_name <- tags[[i]]
      tag_value <- tag(tag_name)
    } else {
      tag_name <- names(tags[i])
      tag_value <- tag(tag_name,
        attrs = tags[[i]][[1]],
        void = is.list(tags[i][[tag_name]]) && isTRUE(tags[i][[tag_name]]$void),
        escape = is.list(tags[i][[tag_name]]) && isTRUE(tags[i][[tag_name]]$escape)
      )
    }
    assign(tag_name, tag_value, .GlobalEnv)
  }
}

register_html(
  "p",
  "b",
  a = "href",
  img = list(c("src", "width", "height"), void = TRUE),
  script = list(c("tag"), escape = FALSE)
)

p("Test")
# <HTML> <p>Test</p>
p("Test with id", id = 2)
# <HTML> <p id = "2">Test with id</p>
p("test with class", class = "t")
# <HTML> <p class = "t">test with class</p>
p("test with both", id = 2, class = "t")
# <HTML> <p id = "2" class = "t">test with both</p>
p
# function (..., class = NULL, id = NULL)
#...
# Note that it has the correct tags.

p("calling with incorrect tag", href = "bad")
# Error in p("calling with incorrect tag", href = "bad") :
#   p only takes can implement the following: class, id
#   You tried to implement href

a("The Googs", href = "http://www.google.com")
# <HTML> <a href = "http://www.google.com">The Googs</a>

img(src = "test.gif", width = 10, height = 10)
# <HTML> <img src = "test.gif" width = "10" height = "10"></img>

img
# function (..., src = NULL, width = NULL, height = NULL, class = NULL,
#    id = NULL)

p("Text ", "with &escaping!", b("BOLD &escape!"))
# <HTML> <p>Text with &amp;escaping!<b>BOLD &amp;escape!</b></p>

script("Script has no escape &&&!")
# <HTML> <script>Script has no escape &&&!</script>

p("This paragraph tag contains ", b("bold!"), " and a ", a("link", href = "www.example.com"))
# <HTML> <p>This paragraph tag contains <b>bold!</b> and a <a href = "www.example.com">link</a></p>
